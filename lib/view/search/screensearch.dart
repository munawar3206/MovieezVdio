import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/view/search/widget/searchIdle.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tmdb/view/search/widget/searchIdle.dart';
import 'package:tmdb/view/search/widget/serch_result.dart';
import 'package:tmdb/view/widgets/app_bar_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Search",
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoSearchTextField(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Color.fromARGB(255, 103, 102, 102),
                  ),
                  suffixIcon: Icon(
                    CupertinoIcons.mic,
                    color: Color.fromARGB(255, 76, 76, 76),
                  ),
                  backgroundColor: Color.fromARGB(255, 199, 198, 198),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(child: SearchIdle()),
                // Expanded(child: SeachResultWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
