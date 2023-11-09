import 'package:flutter/material.dart';
import 'package:tmdb/consnants/color.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor:kblack,
            selectedItemColor:kwhite,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle), label: "New & Hot"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: "Downloads"),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
            ],
          );
        });
  }
}
