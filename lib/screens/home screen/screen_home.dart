import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/db/functions/db_helper.dart';
import 'package:mtracker/db/model/trasaction_model.dart';
import 'package:mtracker/main.dart';
import 'package:mtracker/screens/home%20screen/widgets/balance_card_widget.dart';
import 'package:mtracker/screens/home%20screen/widgets/chart_widget.dart';
import 'package:mtracker/screens/home%20screen/widgets/common_widgets.dart';
import 'package:mtracker/screens/home%20screen/widgets/home_recent_widget.dart';
import 'package:mtracker/screens/statistics%20screen/stastistics_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String profName = '';
dynamic totalData;

DateTime today = DateTime.now();
DateTime now = DateTime.now();
int monthIndex = 1;

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  DbHelper dbHelper = DbHelper();
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  @override
  void initState() {
    getProfileName();
    dbHelper.fetch();
    statisticsIndex = 1;
    statisticsDropDownValue = 'Income';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> months = [
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

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirm Exit?'),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Color.fromARGB(255, 101, 209, 190),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Color.fromARGB(255, 101, 209, 190),
                    ),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              child: ListView(
                children: [
                  commonSizedBox(25),
                  Row(
                    children: [
                      Text(
                        'Welcome $profName',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                  commonSizedBox(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //first  month container
                      InkWell(
                        onTap: () {
                          setState(() {
                            monthIndex = 3;
                            today =
                                DateTime(now.year, now.month - 2, today.day);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: monthIndex == 3
                                ? const Color.fromARGB(255, 101, 209, 190)
                                : const Color.fromARGB(255, 217, 217, 217),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            months[now.month - 3],
                            style: TextStyle(
                                fontSize: 14,
                                color: monthIndex == 3
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      //second month container
                      InkWell(
                        onTap: () {
                          setState(() {
                            monthIndex = 2;
                            today =
                                DateTime(now.year, now.month - 1, today.day);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: monthIndex == 2
                                ? const Color.fromARGB(255, 101, 209, 190)
                                : const Color.fromARGB(255, 217, 217, 217),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            months[now.month - 2],
                            style: TextStyle(
                                fontSize: 14,
                                color: monthIndex == 2
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      //third month container
                      InkWell(
                        onTap: () {
                          setState(() {
                            monthIndex = 1;
                            today = DateTime.now();
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: monthIndex == 1
                                ? const Color.fromARGB(255, 101, 209, 190)
                                : const Color.fromARGB(255, 217, 217, 217),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            months[now.month - 1],
                            style: TextStyle(
                                fontSize: 14,
                                color: monthIndex == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ],
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
                          return Column(
                            children: [
                              commonSizedBox(65),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/no trans.png'))),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'No transactions yet',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          );
                        }
                      }
                      if (snapshot.data == null) {
                        return const Text('');
                      }
                      getTotalBalance(snapshot.data!);
                      totalData = snapshot.data!;
                      return Column(
                        children: [
                          BalanceCard(
                              totalBalance: totalBalance,
                              totalIncome: totalIncome,
                              totalExpense: totalExpense),
                          commonSizedBox(15),
                          Row(
                            children: const [
                              Text(
                                'Income',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          commonSizedBox(15),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: ChartWidget(
                                entireData: snapshot.data!, height: 250),
                          ),
                          commonSizedBox(15),
                          Row(
                            children: [
                              monthIndex == 1
                                  ? const Text(
                                      'Recent Transactions',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          commonSizedBox(15),
                          monthIndex == 1
                              ? HomeRecentWiidget(
                                  data: snapshot.data!.toList(),
                                )
                              : const SizedBox(),
                          commonSizedBox(85),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getProfileName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final profileName = sharedPreferences.getString(saveKey);
    profName = profileName!;
    setState(() {});
  }

  getTotalBalance(List<TransactionModel> entireDate) {
    totalBalance = 0;
    totalExpense = 0;
    totalIncome = 0;

    for (TransactionModel data in entireDate) {
      if (data.date.month == today.month) {
        if (data.type == 'Income') {
          totalBalance += data.amount;
          totalIncome += data.amount;
        } else {
          totalBalance -= data.amount;
          totalExpense += data.amount;
        }
      }
    }
  }
}
