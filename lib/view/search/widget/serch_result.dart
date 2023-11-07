import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/controller/search_result_provider.dart';
import 'package:tmdb/model/movie_info.dart';
// import 'package:tmdb/model/tmdb_api_response.dart';
import 'package:tmdb/service/api_key.dart';
// import 'package:tmdb/service/apiendpoint.dart';
// import 'package:tmdb/service/base_client.dart';
// import 'package:tmdb/view/search/widget/title.dart';
import 'package:tmdb/view/widgets/mainTitle.dart';

class SearchResultWidget extends StatefulWidget {
  final String apiQuery;
  SearchResultWidget({super.key, required this.apiQuery});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  void initState() {
    super.initState();
    // Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Movies & TV"),
        // KHeight,
        Expanded(child: Consumer<SearchResultProvider>(
          builder: (context, provider, child) {
            Provider.of<SearchResultProvider>(context, listen: false)
                .fetchSearchResult(widget.apiQuery);
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children:
                  List.generate(provider.searchResultMovies.length, (index) {
                MovieInfoModel movieInfo = provider.searchResultMovies[index];
                if (movieInfo.posterPath != null) {
                  String imageUrl =
                      'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
                  return MainCard(imageUrl: imageUrl);
                }
                return const SizedBox();
              }),
            );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
