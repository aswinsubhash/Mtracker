import 'package:flutter/material.dart';
import '../../db/functions/db_helper.dart';
import '../../db/model/trasaction_model.dart';
import '../home%20screen/dash_screen.dart';
import '../home%20screen/widgets/chart_widget.dart';
import '../home%20screen/widgets/common_widgets.dart';

class ScreenStatistics extends StatefulWidget {
  const ScreenStatistics({super.key});

  @override
  State<ScreenStatistics> createState() => _ScreenStatisticsState();
}

int statisticsIndex = 1;
String statisticsDropDownValue = 'Income';

class _ScreenStatisticsState extends State<ScreenStatistics> {
  final items = <String>['Income', 'Expense'];
  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = DbHelper();
    return WillPopScope(
       onWillPop: () async{
       currentSelectedIntex = 0;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return const DashScreen();
        },));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Statistics',
            style: TextStyle(color: Colors.black,fontSize: 22),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 101, 209, 190),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              iconEnabledColor: Colors.white,
                              dropdownColor:
                                  const Color.fromARGB(255, 101, 209, 190),
                              style: const TextStyle(color: Colors.white),
                              underline: const Text(''),
                              borderRadius: BorderRadius.circular(10),
                              items: items
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: statisticsDropDownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  statisticsDropDownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              statisticsIndex = 1;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: statisticsIndex == 1
                                  ? const Color.fromARGB(255, 101, 209, 190)
                                  : const Color.fromARGB(255, 201, 245, 235),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'This Month',
                                style: TextStyle(
                                    color: statisticsIndex == 1
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              statisticsIndex = 2;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: statisticsIndex == 2
                                  ? const Color.fromARGB(255, 101, 209, 190)
                                  : const Color.fromARGB(255, 201, 245, 235),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'This Year',
                                style: TextStyle(
                                    color: statisticsIndex == 2
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      commonSizedBox(40),
                      FutureBuilder<List<TransactionModel>>(
                        future: dbHelper.fetch(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text('');
                          }
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    children: [
                                      commonSizedBox(75),
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.8,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            opacity: 0.8,
                                            image: AssetImage(
                                                'assets/images/no graph.png'),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'No Records',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          }
                          if (snapshot.data == null) {
                            return const Text('');
                          }
    
                          return Padding(
                            padding: const EdgeInsets.only(right: 9.0),
                            child: ChartWidget(
                              entireData: snapshot.data!,
                              height: MediaQuery.of(context).size.height * 0.66,
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
