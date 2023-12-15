import 'package:flutter/material.dart';
import 'package:watchmovie_app/editAccount.dart';
import 'package:watchmovie_app/editPackage.dart';
import 'package:watchmovie_app/login.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 20, bottom: 10),
              child: Text(
                "บัญชี",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 0, right: 5, left: 5),
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
                      title: Text(
                        "ning04092536@gmail.com",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Courier',
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    ListTile(
                      title: Text(
                        "รหัสผ่าน: *********",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      // trailing: Text(
                      //   "88888",
                      //   style: TextStyle(
                      //     color: Colors.black87,
                      //     fontFamily: 'Courier', 
                      //   ),
                      // ),
                    ),
                    ListTile(
                      title: Text(
                        "โทรศัพท์: 0971204154",
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
                             builder: (BuildContext context) => EditAccount()));
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
                             builder: (BuildContext context) => EditPackage()));
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
                             builder: (BuildContext context) => EditAccount()));
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
                             builder: (BuildContext context) => PageLogin()));
                   
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
