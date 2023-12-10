import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchmovie_app/widgets/movies_slider2.dart';
import 'package:watchmovie_app/widgets/trending_slider2.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/LogoApp_movie2.png',
          fit: BoxFit.cover,
          height: 60,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'สำหรับ Profile',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32,),
              const TrendingSlider(),
              const SizedBox(height: 32),
              Text(
                'เนื้อหาเปิดตัวใหม่',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              const MoviesSlider(),
            ],
          )
        ),
      ),
    );
  }
}