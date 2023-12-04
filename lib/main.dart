import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'screens/splash%20screen/splash_screen.dart';

const saveKey = 'profile name';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mtracker',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 101, 209, 190),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home:  const ScreenSplash(),
    );
  }
}
