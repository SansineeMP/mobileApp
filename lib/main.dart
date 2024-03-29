import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchmovie_app/class/bottomTab.dart';
import 'package:watchmovie_app/mainapp.dart';
import 'package:watchmovie_app/test_video.dart';
// import 'package:watchmovie_app/login.dart';
// import 'package:watchmovie_app/mainapp.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testflix',
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color(0xFFb71c1c)),
      home: mainApp(),
    );
  }
}
