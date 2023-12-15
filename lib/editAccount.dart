import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController emailController = TextEditingController(); 
  TextEditingController passwordController = TextEditingController(); 
  TextEditingController newPasswordController = TextEditingController(); 
  TextEditingController phoneController = TextEditingController(); 

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
                "แก้ไขข้อมูลบัญชี",
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
                        "แก้ไขรายละเอียดสมาชิก",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Courier',
                        ),
                      ),
                      subtitle: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "กรุณากรอก Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "รหัสผ่าน: ",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: TextField(
                        controller: passwordController,
                        obscureText: true, 
                        decoration: InputDecoration(
                          hintText: "กรุณากรอกรหัสผ่าน",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "รหัสผ่านใหม่",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Courier',
                        ),
                      ),
                      subtitle: TextField(
                        controller: newPasswordController,
                        obscureText: true, 
                        decoration: InputDecoration(
                          hintText: "กรุณากรอกรหัสผ่านใหม่",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ListTile(
                      title: Text(  
                        "เบอร์โทร",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Courier',
                        ),
                      ),
                      subtitle: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: "กรุณากรอกเบอร์โทร",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                      
                      },
                      child: Text(
                        "บันทึกข้อมูล",
                        style: TextStyle(color: Colors.blue, height: 3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
