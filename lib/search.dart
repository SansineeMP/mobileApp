import 'package:flutter/material.dart';
import 'package:watchmovie_app/model/movie_model.dart';

class PageSearch extends StatefulWidget {
  const PageSearch({super.key});

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  static List<MovieModel> main_movie_list = [
    MovieModel("The Godfather", 
        "https://m.media-amazon.com/images/W/MEDIAX_792452-T1/images/I/51Eq4-xce0L._AC_SL1000_.jpg"),
    MovieModel("The Dark Knight", 
        "https://down-th.img.susercontent.com/file/th-11134207-7qul8-lk5b3ozxg9qh60"),
    MovieModel("Pulp Fiction",
        "https://lzd-img-global.slatic.net/g/p/981288f2288eaa06648492aee4139a95.jpg_720x720q80.jpg"),
    MovieModel("The Lord of the Reing",
        "https://th-live-01.slatic.net/p/35c17d17b366a2cc31e20399e7dd370d.jpg"),
    MovieModel("12 Angry Men",
        "https://ae01.alicdn.com/kf/HTB16UJzcAfb_uJkSndVq6yBkpXah.jpg_640x640Q90.jpg_.webp"),
    MovieModel("Star Wars",
        "https://down-th.img.susercontent.com/file/945dd25000782513327e181e8f6316de"),
  ];

  List<MovieModel> display_list = List.from(main_movie_list);

  void updateList(String value){
    setState(() {
      display_list = main_movie_list.where((element) => element.movie_title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 27, 27),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Movie",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(8, 180, 168, 168),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Serach',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(
                      display_list[index].movie_title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // subtitle: Text(
                    //  '${display_list[index].movie_release_year!}',
                    //  style: TextStyle(
                    //   color: Colors.white60,
                    //  ),
                    // ),
                    // trailing: Text('${display_list[index].reting}',
                    //   style: TextStyle(
                    //     color: Colors.amber
                    //   ),
                    // ),
                    leading: Image.network(display_list[index].movie_poster_url!),
                  ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
