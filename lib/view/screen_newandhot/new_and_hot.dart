import 'package:flutter/material.dart';
import 'package:tmdb/view/screen_newandhot/coming_soon.dart';
import 'package:tmdb/view/screen_newandhot/coming_soon_widget.dart';
import 'package:tmdb/view/screen_newandhot/everyone.dart';

const image1 =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/9XP8b9vpk7CPAZz58eBo18blaVh.jpg";

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(73),
            child: AppBar(
              title: const Text("New & Hot"),
              elevation: 0,
              actions: const [
                Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: const [
                    Tab(
                      text: "🍿Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone Watching...",
                    )
                  ]),
            ),
          ),
          body: TabBarView(
            children: [
              _buildComingSoon(context),
              _buildEveryonesWatching(),
            ],
          )),
    );
  }
}

Widget _buildEveryonesWatching() {
  return const everyonewatching();
}

Widget _buildComingSoon(BuildContext context) {
  return const ComingSoonWidget();
}
