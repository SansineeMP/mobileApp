//import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watchmovie_app/class/bottomTab.dart';
import 'package:watchmovie_app/class/url.dart';
//import 'package:watchmovie_app/class/url.dart';
import 'package:watchmovie_app/register.dart';
import 'package:another_flushbar/flushbar.dart';

class PageLogin extends StatefulWidget {
  const PageLogin();

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final Dio dio = Dio();
  TextEditingController username = TextEditingController();
  TextEditingController pass_word = TextEditingController();

  login() async {
    try {
      final response = await dio.post("$ipcon/member/login",
          data: {'phone': username.text, 'pass_word': pass_word.text});
      print(response);

      if (response.statusCode == 200) {
        showFlushbar('Login success', Colors.green);

        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => const bottomTab()),
        //     (route) => false);
      } else {
        showFlushbar('Invalid credentials. Please try again.', Colors.red);
      }
    } catch (error) {
      print("Error during login: $error");
      showFlushbar(
          'An error occurred during login. Please try again.', Colors.red);
    }
  }

  void showFlushbar(String message, Color color) {
    Flushbar(
      title: 'Login',
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: color, // Set background color based on success or error
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/LogoApp_movie2.png',
            fit: BoxFit.cover,
            height: 80,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              // _header(context),
              _inputField(
                context,
              )
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          'Welcome To App',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          'Enter to Login',
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: username,
          decoration: InputDecoration(
            hintText: "อีเมลหรือหมายเลขโทรศัพท์",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColorLight.withOpacity(0.1),
            filled: true,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: pass_word,
          decoration: InputDecoration(
            hintText: "รหัสผ่าน",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColorLight.withOpacity(0.1),
            filled: true,
          ),
        ),
        SizedBox(height: 8),
        FilledButton.tonal(
          onPressed: () => login(),
          style: FilledButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 60),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 13),
          ),
          child: const Text(
            'เข้าสู่ระบบ',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("หรือยังไม่มีบัญชีผู้ใช้?"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PageRegister()));
                },
                child: const Text("สมัครสมาชิก"))
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
