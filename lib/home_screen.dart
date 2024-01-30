import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchmovie_app/account.dart';
import 'package:watchmovie_app/class/bottomTab.dart';
import 'package:watchmovie_app/search.dart';
import 'package:dio/dio.dart';
import 'package:watchmovie_app/class/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PageSearch()));
            },
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Account()));
            },
          ),
        ],
        title: info_user.isEmpty || info_user == [] 
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CircularProgressIndicator(),
            )
          : Padding(
          padding: const EdgeInsets.only(left: 16.0), // Add left padding to the title
          child: Row(
            children: [
              // Text(
              //   'สำหรับ Profile',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Text(
                'สำหรับ ${info_user[0]['firstname']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              // Add additional widgets if needed
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'รายการทีวี',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ภาพยนตร์',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'หมวดหมู่',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Stack(
                children: [
                  Image.asset(
                    'assets/หนัง5.jpg',
                    width: 1000,
                    height: 800, // Increased image height
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 60, // Adjusted button position
                    left: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        fixedSize: Size(150, 50),
                      ),
                      child: Text(
                        'เล่น',
                        style: TextStyle(
                          fontSize: 20, // Adjusted button font size
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    right: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(190, 50),
                      ),
                      child: Text(
                        'เพิ่มรายการของฉัน',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'เนื้อหาเปิดตัวใหม่',
                style: GoogleFonts.aBeeZee(
                  fontSize: 30, // Increased font size
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 180, // Increased height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    List<String> imagePaths = [
                      
                      'assets/หนัง.jpg',
                      'assets/1.jpg',
                      'assets/หนัง6.jpg',
                      'assets/aa.jpg',
                      'assets/หนัง.jpg',
                    ];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        imagePaths[index],
                        width: 120, // Adjusted image width
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ซีรี่ย์อนิเมะจากหนังสือการ์ตูน',
                style: GoogleFonts.aBeeZee(
                  fontSize: 30, // Increased font size
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    List<String> imagePaths = [
                      'assets/หนัง.jpg',
                      'assets/1.jpg',
                      'assets/หนัง6.jpg',
                      'assets/หนัง1.jpg',
                      'assets/หนัง.jpg',
                    ];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        imagePaths[index],
                        width: 120,
                        height: 200, // Adjusted image height
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'รายการทีวี 5 อันดับสูงสุดในไทยวันนี้',
                style: GoogleFonts.aBeeZee(
                  fontSize: 30, // Increased font size
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    List<String> imagePaths = [
                      'assets/หนัง2.jpg',
                      'assets/หนัง1.jpg',
                      'assets/หนัง.jpg',
                      'assets/หนัง4.jpg',
                      'assets/หนัง5.jpg',
                    ];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        imagePaths[index],
                        width: 120,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
