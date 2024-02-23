import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchmovie_app/ExVideo.dart';
import 'package:watchmovie_app/class/url.dart';



class ActionPage extends StatefulWidget {
  ActionPage({super.key});

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  final Dio dio = Dio();
  List TypeMovie = [];
  List PosterList = [];
  


  get_typeMovie() async{
    final SharedPreferences pfrs = await SharedPreferences.getInstance();
    final ID_typemovie = pfrs.getInt('ID_typemovie');

    final response = await dio.get('$ipcon/typemovie/status/$ID_typemovie');
    print(response.data);

    setState(() {
      TypeMovie = response.data;
      print(TypeMovie);
    });
  }

  get_typePoster() async{
    final SharedPreferences pfrs = await SharedPreferences.getInstance();
    final ID_typemovie = pfrs.getInt('ID_typemovie');

    final response = await dio.get('$ipcon/typemovie/movie/$ID_typemovie');
    print(response.data);

    List<Map<String, dynamic>> posterData = List<Map<String, dynamic>>.from(response.data);
    print("img data " + response.data.toString()); // Printing response data for debugging

    // Assuming you have a variable called PosterList in your state
    setState(() {
      PosterList = posterData;
      print(PosterList);
    });
  }


  @override
  void initState() {
    get_typeMovie();
    get_typePoster();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 27, 27),
      ),
      body: PosterList.isEmpty || PosterList == []
      ?Center(
        child: CircularProgressIndicator(),
      ) 
      :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 35, top: 20, bottom: 10),
              child: Text(
                "${TypeMovie[0]['nameTypemovie']}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PosterList.length,
                  itemBuilder: (context, index) {
                    return 
                    GestureDetector(
                      onTap: () async {
                        // Save ID_movie to SharedPreferences
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setInt('ID_movie', PosterList[index]['ID_movie']);
                        // Navigate to another page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Exvideo()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
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

          ],
        ),
      ),
    );
  }
}
