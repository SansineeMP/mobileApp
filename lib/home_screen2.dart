import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:watchmovie_app/widgets/Gridscreen.dart';
import 'package:watchmovie_app/widgets/listscreen.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Image.asset(
          'assets/LogoApp_movie2.png',
          fit: BoxFit.cover,
          height: 80,
          filterQuality: FilterQuality.high,),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isGrid = !_isGrid;
                });
              },
              icon: Icon(
                _isGrid ? Icons.list : Icons.grid_view,
                color: Colors.white,
              ))
        ],
      ),
      body: _isGrid ? GridScreen() : ListScreen(),
    );
  }
}
