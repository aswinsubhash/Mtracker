import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final String settingsText;
  final IconData settingsIcon;
  final Widget trail;

  const SettingsWidget({
    super.key,
    required this.settingsText,
    required this.settingsIcon,
    this.trail = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        settingsIcon,
        color: Colors.black,
        size: 25,
      ),
      title: Text(
        settingsText,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: trail,
    );
  }
}
