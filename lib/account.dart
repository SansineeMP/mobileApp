import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchmovie_app/editAccount.dart';
import 'package:watchmovie_app/editPackage.dart';
import 'package:watchmovie_app/login.dart';
import 'package:watchmovie_app/class/url.dart';
// import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  // final String ID_Member;
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List info_user = [];
  final Dio dio = Dio();

  get_info() async {
    final SharedPreferences pfrs = await SharedPreferences.getInstance();
    final ID_Member = pfrs.getInt('ID_Member');

    // final response = await dio.get('$ipcon/auth/useracc?ID_Member=$ID_Member');
    final response = await dio.get('$ipcon/auth/useracc/$ID_Member');

    print(response.data);
    setState(() {
      info_user = response.data;
    });
  }

  @override
  void initState() {
    get_info();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 31, 27, 27),
        title: Center(
          child: Image.asset(
            'assets/LogoApp_movie2.png',
            fit: BoxFit.cover,
            height: 80,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      body: info_user.isEmpty || info_user == []
      // if info_user is Empty or info_user = []
      // show Progress
          ? Center(
              child: CircularProgressIndicator(),
            )
      // else Show Body
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      "บัญชี",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.only(top: 0, right: 5, left: 5, bottom: 10),
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "การเป็นสมาชิกและรายละเอียดแพ็คเกจ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          ListTile(
                            //  title: Text(
                            //   'Email: ${info_user[0]['Email']}',
                            //   style: TextStyle(
                            //     color: Colors.black87,
                            //   ),
                            // ),
                            title: Text(
                              info_user != null && info_user.isNotEmpty
                                  ? 'Email: ${info_user[0]['Email']}'
                                  : 'N/A', // ในกรณีที่ไม่พบข้อมูลหรือข้อมูลไม่ถูกต้อง
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Courier',
                              ),
                            ),
                          ),
                          // SizedBox(height: 10),
                          ListTile(
                            title: Text(
                              'รหัสผ่าน: ${info_user[0]['pass_word']}',
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "โทรศัพท์: ${info_user[0]['phone']}",
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Courier',
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditAccount()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 190, 53, 53),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "แก้ไขข้อมูลบัญชี",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "รายอะเอียดแพ็คเกจ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "30 DAY 99฿",
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Courier',
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditPackage()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 190, 53, 53),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "เปลี่ยนแพ็คเกจ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditAccount()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 77, 76, 76),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "ยกเลิกการเป็นสมาชิก",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PageLogin()));
                        },
                        child: Text(
                          "ออกจากระบบ",
                          style: TextStyle(color: Colors.red, height: 5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
