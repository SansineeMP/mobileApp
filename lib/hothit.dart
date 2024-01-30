import 'package:flutter/material.dart';
import 'package:watchmovie_app/search.dart';

class Hothit extends StatefulWidget {
  const Hothit({Key? key}) : super(key: key);

  @override
  State<Hothit> createState() => _HothitState();
}

class _HothitState extends State<Hothit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Align title to the left
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
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0), // Add left padding to the title
          child: Row(
            children: [
              Text(
                'ใหม่มาแรงวันนี้',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
          children: [
            SizedBox(height: 20), // Add space between AppBar and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/hh.jpg', // Replace with your image path
                    width: 420, // Adjust the width as needed
                    height: 250, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                    'ขอให้รักเรามีความสุข',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 140), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                  SizedBox(width: 10), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                'มิโยะไม่มีโอกาสเฉิดฉายในโลกที่ผู้คนต่างมีพลังพิเศษ หรือที่สุดแล้ว\n'
                'เธอจะพิสูจน์ให้เห้นได้ว่าเป็นเพชรในตม ผลงานที่สร้างโดยสตูดิโอ\n'
                'kinema Citrus',
                 style: TextStyle(
                 fontSize: 14,
                 color: Colors.grey,
                  ),
                ),

                ],
              ),
            ),
            SizedBox(height: 20), // Add space between AppBar and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/a.jpg', // Replace with your image path
                    width: 420, // Adjust the width as needed
                    height: 250, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                    'MASK GIRL',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 200), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                  SizedBox(width: 10), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                'กลางวันเป็นสาวออฟฟิศ กลางคืนเป็นนางแบบเว็บแคม\n'
                'คิมโมมีนึกว่าตัวเองจัดการทุกอย่างได้\n'
                'จนกระทั่งถูกเพื่อนร่วมงานขุดคุ้ยเรื่องส่วนตัว',
                 style: TextStyle(
                 fontSize: 14,
                 color: Colors.grey,
                  ),
                ),

                ],
              ),
            ),
            SizedBox(height: 20), // Add space between AppBar and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bb.jpg', // Replace with your image path
                    width: 400, // Adjust the width as needed
                    height: 250, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                    'บรีช เทพมรณะ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 195), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                  SizedBox(width: 10), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                'หลังจากที่ “คุโรซากิ อิจิโกะ” ได้พลังวิเศษจาก “คุจิกิ ลูเคีย”\n'
                ' ยมทูตที่ได้รับบาดเจ็บ ทั้งคู่จึงช่วยกันตามล่าเหล่าวิญญาณที่หายไป\n'
                ,
                 style: TextStyle(
                 fontSize: 14,
                 color: Colors.grey,
                  ),
                ),

                ],
              ),
            ),
            SizedBox(height: 20), // Add space between AppBar and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/สส.jpg', // Replace with your image path
                    width: 400, // Adjust the width as needed
                    height: 250, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                    'Horimiya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 200), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                  SizedBox(width: 10), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                'สาวสุดป๊อบที่ชอบเฮฮาปาร์ตี้ซึ่งไม่มีใครรู้ว่าตัวจริงเป็นคนติดบ้า\n'
                ' ได้มาใกล้ชิดสนิทสนมกับเพื่อนร่วมชั้นหนุ่มเนิร์ดที่ซ่อนรอยสักและรอย\n'
'เจาะร่างกายตอนอยู่โรงเรียน\n'
                ,
                 style: TextStyle(
                 fontSize: 14,
                 color: Colors.grey,
                  ),
                ),

                ],
              ),
            ),
            SizedBox(height: 20), // Add space between AppBar and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/1.jpg', // Replace with your image path
                    width: 400, // Adjust the width as needed
                    height: 250, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                    'ขอให้รักเรามีความสุข',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 120), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                  SizedBox(width: 10), // Add space between text and icon
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 50, // Increased the size of the play button icon
                      color: const Color.fromARGB(255, 253, 250, 250),
                    ),
                    onPressed: () {
                      // Add your play button onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
                children: [
                  Text(
                'มิโยะไม่มีโอกาสเฉิดฉายในโลกที่ผู้คนต่างมีพลังพิเศษ หรือที่สุดแล้ว\n'
                'เธอจะพิสูจน์ให้เห้นได้ว่าเป็นเพชรในตม ผลงานที่สร้างโดยสตูดิโอ\n'
                'kinema Citrus',
                 style: TextStyle(
                 fontSize: 14,
                 color: Colors.grey,
                  ),
                ),

                ],
              ),
            ),
            SizedBox(height: 20),
          ],
          
        ),
      ),
    );
  }
}
