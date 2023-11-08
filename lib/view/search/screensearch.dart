import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/controller/search_provider.dart';
import 'package:tmdb/view/search/widget/searchIdle.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tmdb/view/search/widget/searchIdle.dart';
import 'package:tmdb/view/search/widget/serch_result.dart';
import 'package:tmdb/view/widgets/app_bar_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQueryModel = Provider.of<SearchQueryProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Search",
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
                Color.fromARGB(255, 1, 4, 68) ?? Colors.blue,
                Color.fromARGB(255, 0, 0, 0) ?? Colors.blue,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(
                    onChanged: (value) {
                      searchQueryModel.updateQuery(value);
                    },
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Color.fromARGB(255, 103, 102, 102),
                    ),
                    suffixIcon: Icon(
                      CupertinoIcons.clear_thick_circled,
                      color: Color.fromARGB(255, 76, 76, 76),
                    ),
                    backgroundColor: Color.fromARGB(255, 199, 198, 198),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: searchQueryModel.query.isEmpty
                          ? const SearchIdleWidget()
                          : SearchResultWidget(
                              apiQuery: searchQueryModel.query))
                  //   Expanded(child: SearchIdle()),
                  //  Expanded(child: SearchResultWidget(apiQuery: '',)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
