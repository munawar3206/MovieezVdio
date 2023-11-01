import 'package:flutter/material.dart';
import 'package:tmdb/view/downloads/screen_downloads.dart';
// import 'package:tmdb/view/fastlaugh/screen_fastand_laugh.dart';
import 'package:tmdb/view/home/screen_home.dart';
import 'package:tmdb/view/main_page/widgets/bottom_bar.dart';
import 'package:tmdb/view/screen_newandhot/new_and_hot.dart';
import 'package:tmdb/view/search/screensearch.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
  
    ScreenDownload(),
    ScreenSearch(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
