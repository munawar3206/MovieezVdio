import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/view/home/widgets/numberItitle_card.dart';
import 'package:tmdb/view/widgets/app_bar_widget.dart';
import 'package:tmdb/view/widgets/hori_title_card.dart';

List<String> imageUrl1 = [
  "https://c4.wallpaperflare.com/wallpaper/156/167/750/movies-thor-chris-hemsworth-black-background-wallpaper-preview.jpg",
  "https://c4.wallpaperflare.com/wallpaper/492/27/721/great-leonopteryx-toruk-makto-avatar-4k-wallpaper-preview.jpg",
  "https://c4.wallpaperflare.com/wallpaper/507/830/385/captain-america-captain-america-civil-war-captain-america-the-first-avenger-captain-america-the-winter-soldier-movies-hd-wallpaper-preview.jpg",
  "https://c4.wallpaperflare.com/wallpaper/649/1012/960/john-wick-movie-poster-wallpaper-preview.jpg"
];

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "MoviePrO",
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color.fromARGB(255, 0, 0, 0) ?? Colors.blue,
                Color.fromARGB(255, 9, 3, 43) ?? Colors.blue,
                Color.fromARGB(255, 0, 1, 21) ?? Colors.blue,
                Color.fromARGB(255, 0, 0, 0) ?? Colors.blue,
              ],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: SizedBox(
                        height: 50,
                        width: 70,
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 40,
                      child: Center(
                        child: Text(
                          "Movies",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: Center(
                        child: Text(
                          "TV shows",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        viewportFraction: 1.0,
                      ),
                      items: imageUrl1.map((url) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(url),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.verified),
                      label: const Text(
                        "Free Trail Of Premium",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Share",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 50,
                  //   left: 135,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       Icons.play_circle_outline_rounded,
                  //       size: 75,
                  //       color: const Color.fromARGB(255, 255, 255, 255),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Popular Movie",
                  apiUrl: ApiEndPoints.moviepopular,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Trending Movie",
                  apiUrl: ApiEndPoints.trendingMovies,
                ),
              ),
              const SizedBox(height: 10),
              NumberTitleCard(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Upcoming",
                  apiUrl: ApiEndPoints.upcoming,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Tv Shows",
                  apiUrl: ApiEndPoints.tvtoprate,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
