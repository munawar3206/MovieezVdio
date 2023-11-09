import 'package:flutter/material.dart';
import 'package:tmdb/consnants/color.dart';

import 'package:tmdb/view/screen_newandhot/coming_soon_widget.dart';

import 'package:tmdb/view/screen_newandhot/everyone_widget.dart';


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
              title: const Text.rich(TextSpan(text: "New  ", children: [
                TextSpan(
                    text: "&  ",
                    style: TextStyle(fontSize: 15),
                    children: [
                      TextSpan(
                          text: "Hot",
                          style: TextStyle(color: Colors.red, fontSize: 23))
                    ])
              ])),
              elevation: 0,
              actions: const [
                Icon(
                  Icons.cast,
                  color:kwhite,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.person,
                  color: kwhite,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor:kwhite,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color:kwhite,
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
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 9, 3, 43) ,
                  Color.fromARGB(255, 1, 4, 68) ,
                  Color.fromARGB(255, 0, 0, 0) ,
                ],
              ),
            ),
            child: TabBarView(
              children: [
                _buildComingSoon(context),
                _buildEveryonesWatching(),
              ],
            ),
          )
          ),
    );
  }
}

Widget _buildEveryonesWatching() {
  return const EveryonesWatchingWidget();
}

Widget _buildComingSoon(BuildContext context) {
  return const ComingSoonWidget();
}
