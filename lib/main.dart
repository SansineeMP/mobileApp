import 'package:flutter/material.dart';
import 'package:watchmovie_app/login.dart';
// import 'package:watchmovie_app/login copy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testflix',
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color(0xFFb71c1c)),

      // theme: ThemeData.dark().copyWith(
      //   //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   scaffoldBackgroundColor: const Color.fromARGB(66, 45, 44, 44),
      //   useMaterial3: true,
      // ),
      home:  PageLogin(),
    );
  }
}
