import 'package:flutter/material.dart';
import 'package:smart_indicator/appscreens/infopage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart-Indicator',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const InfoPage(),
    );
  }
}
