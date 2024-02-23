import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:watchmovie_app/class/url.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse('$ipcon/video/test_1.mp4'),
      ),
    );
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
        title: Text('Video Player'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9, // You can adjust this aspect ratio as needed
          child: FlickVideoPlayer(
            flickManager: flickManager,
            preferredDeviceOrientationFullscreen: [
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
            ],
            flickVideoWithControls: FlickVideoWithControls(
              controls: FlickPortraitControls(),
            ),
          ),
        ),
      ),
    );
  }
}




// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   final Dio dio = Dio();
//   String videoPath = ''; // Variable to store the video file path
//   late VideoPlayerController controller;

//   void getVideoPath() async {
//     try {
//       final response = await dio.get('$ipcon/video/video/getvideo');
//       print(response.data);

//       if (response.statusCode == 200) {
//         setState(() {
//           videoPath = response.data['videoUrl'] ?? '';
//           controller = VideoPlayerController.file(File(videoPath));
//           // controller.initialize().then((_) {
//           //   // Ensure the controller is initialized before calling setState
//           //   setState(() {});
//           // });
//         });
//       } else {
//         print('Error fetching video: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching video: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getVideoPath();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade700,
//         title: const Text("Flutter Video Player"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: controller.value.aspectRatio,
//                 child: VideoPlayer(controller),
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }


