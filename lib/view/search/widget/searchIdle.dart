import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/consnants/color.dart';
import 'package:tmdb/controller/internet_connectivity.dart';
import 'package:tmdb/controller/search_idle_provider.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/view/widgets/mainTitle.dart';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchidleProvider>(context, listen: false)
        .fetchSearchIDLMovies();
     Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: "Top Searches",
        ),
       k20,
        Expanded(
          child: Consumer<SearchidleProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (value.trendingMovies.isEmpty) {
                return const Text("NO data available");
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 35.0,
                ),
                itemBuilder: (context, index) =>
                    TopSearchItemTile(movieInfo: value.trendingMovies[index]),
                itemCount: value.trendingMovies.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final MovieInfoModel movieInfo;
  const TopSearchItemTile({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Row(
      children: [
        Container(
          width: screenWidth * 0.25,
          height: 135,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
        ),
      ],
    );
  }
}
