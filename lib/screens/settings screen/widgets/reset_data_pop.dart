import 'package:flutter/material.dart';
import '../../all%20transaction%20screen/widget/all_transaction_widget.dart';
import '../../home%20screen/dash_screen.dart';
import '../../splash%20screen/splash_screen.dart';

void resetDataPop(ctx) {
  showDialog(
    context: ctx,
    builder: (ctx) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you really want to reset the data?'),
        actions: [
          TextButton(
            onPressed: () async {
              currentSelectedIntex = 0;
              dbHelper.resetData();
              dbHelper.resetSharedPreference();
              Navigator.of(ctx).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) {
                return const ScreenSplash();
              }), (route) => false);
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
              Navigator.of(ctx).pop();
            },
            child: const Text('No',style: TextStyle(
              color: Color.fromARGB(255, 101, 209, 190)
            ),),
          ),
        ],
      );
    },
  );
}
