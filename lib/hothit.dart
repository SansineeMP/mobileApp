import 'package:dio/dio.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:watchmovie_app/ExVideo.dart';
import 'package:watchmovie_app/class/url.dart';
import 'package:watchmovie_app/search.dart';

class Hothit extends StatefulWidget {
  const Hothit({Key? key}) : super(key: key);

  @override
  State<Hothit> createState() => _HothitState();
}

class _HothitState extends State<Hothit> {
  late FlickManager flickManager;
  List info_statusmovie = [];
  List video_names = [];
  // String ID_movie ='';
  Uri? link;
  // String? link;
  final Dio dio = Dio();
  
  get_statusmovie() async {
    final statusID = 1;
    final response = await dio.get('$ipcon/typemovie/statusmovie/$statusID');

    print(response.data);
    setState(() {
      info_statusmovie = response.data;
      video_names = info_statusmovie.map((data) => data['video_name'].toString()).toList();
      link = Uri.parse('$ipcon/video/$video_names');
      // link = '$ipcon/video/$video_name';

      print(video_names);
      print(link);
    });
  }

  @override
  void initState() {
    get_statusmovie();
    super.initState();

    // print(link);
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.networkUrl(link),
    // );
  }

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
      body: info_statusmovie.isEmpty || info_statusmovie ==[]
  ? Center(
    child: CircularProgressIndicator(),
  )
  : SingleChildScrollView(
    child: Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: video_names.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(video_names[index]),
            );
          },
        ),
        AspectRatio(
          aspectRatio: 16 / 9, // You can adjust this aspect ratio as needed
          child: FlickVideoPlayer(
            flickManager: FlickManager(
              videoPlayerController:
                  VideoPlayerController.networkUrl(link!),
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
              SizedBox(width: 100), // Add space between text and icon
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30, // Increased the size of the play button icon
                  color: const Color.fromARGB(255, 253, 250, 250),
                ),
                onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => Exvideo()));
                  },
              ),
              SizedBox(width: 10), // Add space between text and icon
              IconButton(
                icon: Icon(
                  Icons.play_circle_fill,
                  size: 30, // Increased the size of the play button icon
                  color: const Color.fromARGB(255, 253, 250, 250),
                ),
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Exvideo()));
                  },
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Add horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align content to the left
            children: [
              Text(
            'มิโยะไม่มีโอกาสเฉิดฉายในโลกที่ผู้คนต่างมีพลังพิเศษ',
             style: TextStyle(
             fontSize: 14,
             color: Colors.grey,
              ),
            ),

            ],
          ),
        ),
      ],
    ),
  ),
    );
  }
}
