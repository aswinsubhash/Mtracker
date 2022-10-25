import 'package:flutter/material.dart';
import 'package:mtracker/db/functions/db_helper.dart';
import 'package:mtracker/db/model/trasaction_model.dart';
import 'package:mtracker/screens/all%20transaction%20screen/widget/all_transaction_widget.dart';
import 'package:mtracker/screens/home%20screen/dash_screen.dart';
import 'package:mtracker/screens/home%20screen/widgets/common_widgets.dart';

class ScreenAllTransactions extends StatefulWidget {
  const ScreenAllTransactions({Key? key}) : super(key: key);

  @override
  State<ScreenAllTransactions> createState() => _ScreenAllTransactionsState();
}

String dataFilterValue = 'All';
String yearFilterValue = 'January';
int flag = 1;
String dropDownValue = 'All';

class _ScreenAllTransactionsState extends State<ScreenAllTransactions> {
  final items = <String>[
    'All',
    'Income',
    'Expense',
  ];
  final itemDataFilter = <String>[
    'All',
    'Today',
    'This Month',
    'This Year',
  ];

  final itemsYearFilter = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  DbHelper dbHelper = DbHelper();
  @override
  void initState() {
    currentSelectedIntex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        currentSelectedIntex = 0;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) {
            return const DashScreen();
          },
        ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'All Transactions',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //first drodown

                    Container(
                      width: dataFilterValue == 'This Year'
                          ? MediaQuery.of(context).size.width * 0.26
                          : MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 101, 209, 190),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: DropdownButton<String>(
                          iconEnabledColor: Colors.white,
                          dropdownColor:
                              const Color.fromARGB(255, 101, 209, 190),
                          underline: const Text(''),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          borderRadius: BorderRadius.circular(10),
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: dropDownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    commonSizedBox(10),

                    //second dropdown

                    Container(
                      width: dataFilterValue == 'This Year'
                          ? MediaQuery.of(context).size.width * 0.26
                          : MediaQuery.of(context).size.width * 0.40,
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          underline: const Text(''),
                          borderRadius: BorderRadius.circular(10),
                          items: itemDataFilter
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: dataFilterValue,
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                dataFilterValue = newValue!;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    commonSizedBox(10),

                    //third dropdown

                    dataFilterValue == 'This Year'
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: dataFilterValue == 'This Year'
                                    ? const Color.fromARGB(255, 101, 209, 190)
                                    : const Color.fromARGB(255, 201, 245, 235),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: DropdownButton(
                                disabledHint: const Text('Month'),
                                menuMaxHeight: 200,
                                underline: const Text(''),
                                iconEnabledColor: Colors.white,
                                dropdownColor:
                                    const Color.fromARGB(255, 101, 209, 190),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                                borderRadius: BorderRadius.circular(10),
                                items: dataFilterValue == 'This Year'
                                    ? itemsYearFilter
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()
                                    : null,
                                value: yearFilterValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    yearFilterValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              commonSizedBox(20),
              FutureBuilder<List<TransactionModel>>(
                future: dbHelper.fetch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('');
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      flag = 0;
                      return Column(
                        children: [
                          commonSizedBox(100),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/no-data-found.png'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }
                  if (snapshot.data == null) {
                    return const Text('');
                  }
                  return Column(
                    children: [
                      AllTransactionWidget(data: snapshot.data!),
                      commonSizedBox(90),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
