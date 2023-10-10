import 'package:flutter/material.dart';

import '../../home%20screen/widgets/common_widgets.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        children: [
          commonSizedBox(10),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'About Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          commonSizedBox(10),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Mtracker makes managing personal finances as easy as pie! Now easily record your personal financial transactions, generate graphs, review your daily and monthly financial data and manage your assets with Mtracker's spending tracker and budget planner.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5
                  ),
                ),
              ),
              commonSizedBox(30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 101, 209, 190),
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
