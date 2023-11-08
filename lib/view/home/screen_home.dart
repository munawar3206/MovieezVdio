import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/consnants/base_url.dart';
import 'package:tmdb/controller/internet_connectivity.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/view/home/widgets/big.dart';
import 'package:tmdb/view/home/widgets/numberItitle_card.dart';

import 'package:tmdb/view/widgets/hori_title_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 9, 3, 43),
                Color.fromARGB(255, 0, 1, 21),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 5),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(76, 32, 32, 32),
                    height: 65,
                    width: double.infinity,
                    child: const Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: Center(
                            child: Text(
                              "All",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
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
                                fontWeight: FontWeight.bold,
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
                                fontWeight: FontWeight.bold,
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
                              "Free",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
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
                  const Positioned(
                    bottom: 10,
                    left: 320,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(89, 0, 0, 0),
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Popular Movie",
                  apiUrl: ApiEndPoints.moviepopular,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Trending Movie",
                  apiUrl: ApiEndPoints.trendingMovies,
                ),
              ),
              const SizedBox(height: 10),
              const NumberTitleCard(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: MainTitleCard(
                  title: "Upcoming",
                  apiUrl: ApiEndPoints.upcoming,
                ),
              ),
              bigScreen(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
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
