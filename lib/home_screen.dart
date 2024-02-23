import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchmovie_app/ExVideo.dart';
import 'package:watchmovie_app/account.dart';
import 'package:watchmovie_app/action.dart';
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
  List Poster = [];
  List info_user = [];
  final Dio dio = Dio();
  List PosterList = [];
  List TypeMovie = [];

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

  get_poster() async {
    try {
      final response = await dio.get('$ipcon/video/poster/posterall');
      // Assuming response.data is in JSON format
      List<Map<String, dynamic>> posterData =
          List<Map<String, dynamic>>.from(response.data);
      print("img data " +
          response.data.toString()); // Printing response data for debugging

      // Assuming you have a variable called PosterList in your state
      setState(() {
        PosterList = posterData;
        print(PosterList);
      });
    } catch (e) {
      print('Error fetching poster data: $e'); // Handle errors
    }
  }

  get_typeMovie() async {
    final response = await dio.get('$ipcon/typemovie/status');
    print(response.data);

    setState(() {
      TypeMovie = response.data;
      print(TypeMovie);
    });
  }

  @override
  void initState() {
    get_info();
    get_poster();
    get_typeMovie();
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
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PageSearch()));
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Account()));
            },
          ),
        ],
        title: info_user.isEmpty || info_user == []
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    left: 5.0), // Add left padding to the title
                child: Row(
                  children: [
                    Text(
                      'สำหรับ ${info_user[0]['firstname']}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Add additional widgets if needed
                  ],
                ),
              ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'หมวดหมู่',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: List.generate(
                  TypeMovie
                      .length, // สมมติว่า yourDataList เป็นลิสต์ของข้อมูลที่คุณต้องการแสดง
                  (index) {
                    String text = TypeMovie[index]
                        ['nameTypemovie']; // รับค่าจากลิสต์ของข้อมูล
                    return GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt(
                            'ID_typemovie', TypeMovie[index]['ID_typemovie']);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ActionPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.all(5),
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 68, 67,
                              64), // เปลี่ยนสีพื้นหลังตามที่ต้องการ
                          borderRadius: BorderRadius.circular(
                              10), // ปรับเป็นรูปทรงเรขาคณิตตามต้องการ
                        ), // ปรับระยะห่างตามต้องการ
                        child: Center(
                          child: Text(
                            text,
                            style: TextStyle(
                              color:
                                  Colors.white, // เปลี่ยนสีของข้อความตามต้องการ
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 18),
              Stack(
                children: [
                  Container(
                    height: 300,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 400,
                      height: 600,
                      child: Image.asset(
                        'assets/หนัง5.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Exvideo(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        fixedSize: const Size(100, 45),
                      ),
                      child: const Text(
                        'เล่น',
                        style: TextStyle(
                          fontSize: 15,
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
                        fixedSize: const Size(170, 45),
                      ),
                      child: const Text(
                        'เพิ่มรายการของฉัน',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'เนื้อหาเปิดตัวใหม่',
                style: GoogleFonts.aBeeZee(
                  fontSize: 30, // Increased font size
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PosterList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        // Save ID_movie to SharedPreferences
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('ID_movie', PosterList[index]['ID_movie']);
                        // Navigate to another page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Exvideo()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.all(8.0),
                        width: 120,
                        height: 200,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Colors.red),
                          image: DecorationImage(
                            image: NetworkImage(
                              '$ipcon/video/poster/${PosterList[index]['poster_name']}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
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
              // const SizedBox(height: 10),
              // Text(
              //   'รายการทีวี 5 อันดับสูงสุดในไทยวันนี้',
              //   style: GoogleFonts.aBeeZee(
              //     fontSize: 30, // Increased font size
              //   ),
              // ),
              // SizedBox(
              //   height: 180,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       List<String> imagePaths = [
              //         'assets/หนัง2.jpg',
              //         'assets/หนัง1.jpg',
              //         'assets/หนัง.jpg',
              //         'assets/หนัง4.jpg',
              //         'assets/หนัง5.jpg',
              //       ];
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Image.asset(
              //           imagePaths[index],
              //           width: 120,
              //           height: 200,
              //           fit: BoxFit.cover,
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
