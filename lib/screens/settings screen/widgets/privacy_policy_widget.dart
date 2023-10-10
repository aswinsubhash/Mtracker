import 'package:flutter/material.dart';

import '../../home%20screen/widgets/common_widgets.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          commonSizedBox(10),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          commonSizedBox(10),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'This privacy notice for Mtracker describes how and why we  might collect, store, use, and/or share your information when you use our services, such as when  you:\n Question or concern?If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at support@mtracker.com.',
                  textAlign: TextAlign.center,
                   style: TextStyle(
                    height: 1.3
                  ),
                ),
              ),
              commonSizedBox(40),
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
