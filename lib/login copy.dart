import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:watchmovie_app/class/bottomTab.dart';
import 'package:watchmovie_app/register.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Image.asset(
      //     'assets/LogoApp_movie2.png',
      //     fit: BoxFit.cover,
      //     height: 80,
      //     filterQuality: FilterQuality.high,
      //   ),
      //   centerTitle: true,
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: _inputField(context),
        ),
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 25),
        elevation: 10,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'TextFlix',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                subtitle: const Text(
                  'welcome',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                contentPadding: const EdgeInsets.all(1),
              ),
              const SizedBox(width: 8), // Adjust the width as needed
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(50),
              //   child: SizedBox(
              //     width: 50,
              //     height: 50,
              //     child: Center(child: Icon(Icons.fingerprint_rounded)),
              //   ),
              // ),
              // const SizedBox(height: 32),
              Spacer(),
              Column(
                children: [
                  TextField(
                    decoration: _inputDecoration(
                      context,
                      "อีเมลหรือหมายเลขโทรศัพท์",
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    decoration: _inputDecoration(context, "รหัสผ่าน"),
                  ),
                ],
              ),
              // const SizedBox(height: 14),
              Spacer(),
              FilledButton.tonal(
                onPressed: () {
                  _login(context);
                },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("หรือเข้าสู่ระบบด้วยบัญชี Facebook"),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PageRegister(),
                        ),
                      );
                    },
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(2)),
                    child: const Text("สมัครสมาชิก"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context, String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      filled: true,
    );
  }
}

Future<void> _login(context) async {
  await Flushbar(
    title: 'Login',
    message:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
  ).show(context);

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) {
      return const bottomTab();
    }),
    (route) => false,
  );
}
