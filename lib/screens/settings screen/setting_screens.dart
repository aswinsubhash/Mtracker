import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../home%20screen/dash_screen.dart';
import '../home%20screen/widgets/common_widgets.dart';
import '../settings%20screen/widgets/about_us_widget.dart';
import '../settings%20screen/widgets/feedback.dart';
import '../settings%20screen/widgets/privacy_policy_widget.dart';
import '../settings%20screen/widgets/reset_data_pop.dart';
import '../settings%20screen/widgets/settings_widget.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      resetDataPop(context);
                    },
                    child: const SettingsWidget(
                      settingsText: 'Reset Data',
                      settingsIcon: Icons.restart_alt,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return const PrivacyPolicy();
                        },
                      );
                    },
                    child: const SettingsWidget(
                      settingsText: 'Privacy & Policy',
                      settingsIcon: Icons.privacy_tip_outlined,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.aswinofficial3.mtracker');
                    },
                    child: const SettingsWidget(
                      settingsText: 'Share',
                      settingsIcon: Icons.share_rounded,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      sendMail();
                    },
                    child: const SettingsWidget(
                      settingsText: 'Feedback',
                      settingsIcon: Icons.feedback,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return const AboutUsWidget();
                        },
                      );
                    },
                    child: const SettingsWidget(
                      settingsText: 'About Us',
                      settingsIcon: Icons.info,
                    ),
                  ),
                  commonSizedBox(MediaQuery.of(context).size.height * 0.34),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Text(
                          'Version',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '1.0.2',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
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
