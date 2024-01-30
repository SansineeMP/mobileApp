//import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchmovie_app/login.dart';

class mainApp extends StatefulWidget {
  const mainApp({super.key});

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  double _sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/LogoApp_movie2.png',
                fit: BoxFit.cover,
                height: 80,
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
          actions: [
            Text("ช่วยเหลือ"),
            IconButton(
              icon: Icon(
                Icons.question_mark,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              _widgetImage(context),
              _bottomClik(context)
            ],
          ),
        ),
      ),
    );
  }

 _widgetImage(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      CarouselSlider(
        options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.5, // 80% ของความสูงของหน้าจอ
        aspectRatio: 16/9,
        viewportFraction: 1.0,
        initialPage: 0, // หน้าแรกที่แสดง
        enableInfiniteScroll: true, // การเลื่อนไปข้างหน้าหรือถอยหลังได้ไม่จำกัด
        reverse: false, // การแสดงรูปภาพในลำดับถอยหลัง
        autoPlay: true, // การเล่นอัตโนมัติ
        autoPlayInterval: Duration(seconds: 3), // ระยะเวลาในการเล่นอัตโนมัติ
        autoPlayAnimationDuration: Duration(milliseconds: 800), // ระยะเวลาในการเล่นอัตโนมัติ (Animation)
        autoPlayCurve: Curves.fastOutSlowIn, // ลักษณะของ Animation ในการเล่นอัตโนมัติ
        enlargeCenterPage: true, // การขยายขนาดรูปภาพที่อยู่ตรงกลาง
        scrollDirection: Axis.horizontal, // ทิศทางการเลื่อน (แนวนอน)
      ), items: [
        'assets/test1.jpg',
        'assets/test2.jpg',
        'assets/test3.jpg',
      ].map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              item,
              fit: BoxFit.cover,
            );
          },
        );
      }).toList(),
      )
    ],
  );
}



  _bottomClik(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      FilledButton.tonal(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => PageLogin()),
          );
        },
        style: FilledButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 13),
          backgroundColor: const Color.fromARGB(255, 144, 20, 11), // กำหนดสีพื้นหลังเป็นสีแดง
        ),
        child: const Text(
          'เข้าสู่ระบบ',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ],
  );
}

}