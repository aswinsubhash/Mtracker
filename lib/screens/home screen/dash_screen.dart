import 'package:flutter/material.dart';
import 'package:mtracker/screens/add%20trasaction/screen_add_transaction.dart';
import 'package:mtracker/screens/all%20transaction%20screen/all_transaction_screen.dart';
import 'package:mtracker/screens/home%20screen/screen_home.dart';
import 'package:mtracker/screens/settings%20screen/setting_screens.dart';
import 'package:mtracker/screens/statistics%20screen/stastistics_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}
int currentSelectedIntex = 0;
class _DashScreenState extends State<DashScreen> {
 
 
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const ScreenHome(),
      const ScreenAllTransactions(),
      const ScreenAddTrasaction(),
      const ScreenStatistics(),
      const ScreenSettings()

    ];
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 68,
        width: 68,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 101, 209, 190),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const ScreenAddTrasaction();
                  },
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
         pages[currentSelectedIntex],
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: const Color.fromARGB(255, 101, 209, 190),
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: currentSelectedIntex,
                  onTap: (newIntex) {
                    setState(() {
                      currentSelectedIntex = newIntex;
                    }); 
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_filled,
                        size: 30,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.list_outlined,
                        size: 30,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.transparent,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.bar_chart_outlined,
                        size: 30,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
