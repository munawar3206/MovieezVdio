import 'package:flutter/material.dart';
import 'package:tmdb/consnants/color.dart';
import 'package:tmdb/view/downloads/widget/download.dart';


import 'package:tmdb/view/home/screen_home.dart';
import 'package:tmdb/view/main_page/widgets/bottom_bar.dart';
import 'package:tmdb/view/screen_newandhot/new_and_hot.dart';
import 'package:tmdb/view/search/screensearch.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
  
    DownloadScreen(),
    const ScreenSearch(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kblack,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
