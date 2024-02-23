import 'package:dio/dio.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:watchmovie_app/class/url.dart';

class Exvideo extends StatefulWidget {
  Exvideo({Key? key}) : super(key: key);

  @override
  State<Exvideo> createState() => _ExvideoState();
}

class _ExvideoState extends State<Exvideo> {
  late FlickManager flickManager;
  List info_movie = [];
  String video_name = '';
  // String ID_movie ='';
  Uri? link;
  // String? link;
  final Dio dio = Dio();

  get_movie() async {
    final SharedPreferences pfrs = await SharedPreferences.getInstance();
    final ID_movie = pfrs.getInt('ID_movie');
    print(ID_movie);

    final response = await dio.get('$ipcon/video/movie/$ID_movie');

    print(response.data);
    setState(() {
      info_movie = response.data;
      video_name = response.data[0]['video_name'];
      link = Uri.parse('$ipcon/video/$video_name');
      // link = '$ipcon/video/$video_name';

      print(video_name);
      print(link);
    });
  }

  @override
  void initState() {
    get_movie();
    super.initState();

    // print(link);
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.networkUrl(link),
    // );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 27, 27),
      ),
      body: info_movie.isEmpty || info_movie == []
      ?Center(
        child: CircularProgressIndicator(),
      ) 
      :SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // You can adjust this aspect ratio as needed
              child: FlickVideoPlayer(
                flickManager: FlickManager(
                  videoPlayerController:
                      VideoPlayerController.networkUrl(link!),
                      // VideoPlayerController.network(link!),
                ),
                preferredDeviceOrientationFullscreen: [
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft,
                ],
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickPortraitControls(),
                ),
              ),
            ),
            SizedBox(height: 15), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  info_movie != null && info_movie.isNotEmpty
                      ? 'ชื่อหนัง: ${info_movie[0]['Name_movie']}'
                      : 'N/A',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  info_movie != null && info_movie.isNotEmpty
                      ? 'เรื่องย่อ: ${info_movie[0]['video_detail']}'
                      : 'N/A',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // กระทำเมื่อปุ่มถูกกด
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Play'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        vertical: 15, horizontal: 210), // ปรับขนาดขอบของปุ่ม
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // กำหนดขอบเขตของปุ่ม
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              // mainAxisAlignment: MainAxisAlignment.center,
              padding: EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // กระทำเมื่อปุ่ม "+" ถูกกด
                      },
                      icon: Icon(Icons.add),
                      iconSize: 40, // ปรับขนาดของไอคอน
                      color: Color.fromARGB(
                          255, 243, 245, 246), // ปรับสีของไอคอนตามต้องการ
                    ),
                    SizedBox(width: 125),
                    IconButton(
                      onPressed: () {
                        // กระทำเมื่อปุ่มไลค์ถูกกด
                      },
                      icon: Icon(Icons.thumb_up),
                      iconSize: 40, // ปรับขนาดของไอคอน
                      color: const Color.fromARGB(
                          255, 240, 241, 242), // ปรับสีของไอคอนตามต้องการ
                    ),
                    SizedBox(width: 125),
                    IconButton(
                      onPressed: () {
                        // กระทำเมื่อปุ่มไลค์ถูกกด
                      },
                      icon: Icon(Icons.share),
                      iconSize: 40, // ปรับขนาดของไอคอน
                      color: const Color.fromARGB(
                          255, 245, 245, 246), // ปรับสีของไอคอนตามต้องการ
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'รายการโปรด', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    Text(
                      'ให้คะแนน', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 145,
                    ),
                    Text(
                      'แชร์', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'วิดีโอแนะนำ', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40,),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: [
            //         Container(
            //          width: 170,
            //          height: 100,
            //          decoration: BoxDecoration(
            //           image: DecorationImage(
            //            image: AssetImage('assets/1.jpg'), // เปลี่ยนเป็น path ของรูปภาพที่คุณต้องการ
            //           fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่ที่กำหนด
            //           ),
            //            borderRadius: BorderRadius.circular(20), // กำหนดความโค้งของขอบ
            //            ),
            //          ),
            //          SizedBox(width: 30,),
            //         Text(
            //          'ชื่อหนัง', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
            //         style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //          ),
            //        ),
            //       ],
            //       ),
            //   ),
            // ),
            // SizedBox(height: 17,),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'หลังจากย้ายบ้านเข้ามาอยู่กรุงเทพฯมาตาลดาได้พบกับศัลยแพทย์\n'
            //        'หัวใจเธอผู้ไร้หัวใจทว่าเพื่อนบ้านคนนี้ไม่ได้สนใจอยากทำความรู้จัก\nกับเธอสักมากนัก'

            //        ,
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40,),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: [
            //         Container(
            //          width: 170,
            //          height: 100,
            //          decoration: BoxDecoration(
            //           image: DecorationImage(
            //            image: AssetImage('assets/1.jpg'), // เปลี่ยนเป็น path ของรูปภาพที่คุณต้องการ
            //           fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่ที่กำหนด
            //           ),
            //            borderRadius: BorderRadius.circular(20), // กำหนดความโค้งของขอบ
            //            ),
            //          ),
            //          SizedBox(width: 30,),
            //         Text(
            //          'ชื่อหนัง', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
            //         style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //          ),
            //        ),
            //       ],
            //       ),
            //   ),
            // ),
            // SizedBox(height: 17,),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'หลังจากย้ายบ้านเข้ามาอยู่กรุงเทพฯมาตาลดาได้พบกับศัลยแพทย์\n'
            //        'หัวใจเธอผู้ไร้หัวใจทว่าเพื่อนบ้านคนนี้ไม่ได้สนใจอยากทำความรู้จัก\nกับเธอสักมากนัก'

            //        ,
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40,),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: [
            //         Container(
            //          width: 170,
            //          height: 100,
            //          decoration: BoxDecoration(
            //           image: DecorationImage(
            //            image: AssetImage('assets/1.jpg'), // เปลี่ยนเป็น path ของรูปภาพที่คุณต้องการ
            //           fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่ที่กำหนด
            //           ),
            //            borderRadius: BorderRadius.circular(20), // กำหนดความโค้งของขอบ
            //            ),
            //          ),
            //          SizedBox(width: 30,),
            //         Text(
            //          'ชื่อหนัง', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
            //         style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //          ),
            //        ),
            //       ],
            //       ),
            //   ),
            // ),
            // SizedBox(height: 17,),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'หลังจากย้ายบ้านเข้ามาอยู่กรุงเทพฯมาตาลดาได้พบกับศัลยแพทย์\n'
            //        'หัวใจเธอผู้ไร้หัวใจทว่าเพื่อนบ้านคนนี้ไม่ได้สนใจอยากทำความรู้จัก\nกับเธอสักมากนัก'

            //        ,
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40,),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: [
            //         Container(
            //          width: 170,
            //          height: 100,
            //          decoration: BoxDecoration(
            //           image: DecorationImage(
            //            image: AssetImage('assets/1.jpg'), // เปลี่ยนเป็น path ของรูปภาพที่คุณต้องการ
            //           fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่ที่กำหนด
            //           ),
            //            borderRadius: BorderRadius.circular(20), // กำหนดความโค้งของขอบ
            //            ),
            //          ),
            //          SizedBox(width: 30,),
            //         Text(
            //          'ชื่อหนัง', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
            //         style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //          ),
            //        ),
            //       ],
            //       ),
            //   ),
            // ),
            // SizedBox(height: 17,),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'หลังจากย้ายบ้านเข้ามาอยู่กรุงเทพฯมาตาลดาได้พบกับศัลยแพทย์\n'
            //        'หัวใจเธอผู้ไร้หัวใจทว่าเพื่อนบ้านคนนี้ไม่ได้สนใจอยากทำความรู้จัก\nกับเธอสักมากนัก'

            //        ,
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40,),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.0),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: [
            //         Container(
            //          width: 170,
            //          height: 100,
            //          decoration: BoxDecoration(
            //           image: DecorationImage(
            //            image: AssetImage('assets/1.jpg'), // เปลี่ยนเป็น path ของรูปภาพที่คุณต้องการ
            //           fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่ที่กำหนด
            //           ),
            //            borderRadius: BorderRadius.circular(20), // กำหนดความโค้งของขอบ
            //            ),
            //          ),
            //          SizedBox(width: 30,),
            //         Text(
            //          'ชื่อหนัง', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
            //         style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.bold,
            //          ),
            //        ),
            //       ],
            //       ),
            //   ),
            // ),
            // SizedBox(height: 17,),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'หลังจากย้ายบ้านเข้ามาอยู่กรุงเทพฯมาตาลดาได้พบกับศัลยแพทย์\n'
            //        'หัวใจเธอผู้ไร้หัวใจทว่าเพื่อนบ้านคนนี้ไม่ได้สนใจอยากทำความรู้จัก\nกับเธอสักมากนัก'

            //        ,
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
