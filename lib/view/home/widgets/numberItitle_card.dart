import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/controller/tvtoperate_provider.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';
import 'package:tmdb/view/home/widgets/number_card.dart';
import 'package:tmdb/view/widgets/mainTitle.dart';

class NumberTitleCard extends StatefulWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  State<NumberTitleCard> createState() => _NumberTitleCardState();
}

class _NumberTitleCardState extends State<NumberTitleCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<TvTopRateProvider>(context, listen: false)
        .fetchTvTopRateMovies();
  }

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return Consumer<TvTopRateProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.tvTopRate.isEmpty) {
          return const Text("NO data available");
        }

        imageList = provider.tvTopRate.map((MovieInfoModel movieInfo) {
          if (movieInfo.posterPath == null) {
            return null;
          }
          String imageUrl =
              'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
          return imageUrl;
        }).toList();

        if (imageList.isEmpty) {
          return const Center(child: ListTile(title: Text('No Movies Found')));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainTitle(title: "  Top 10 Shows"),
            // KHeight,
            LimitedBox(
              maxHeight: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => NumberCard(
                          index: index,
                          imageUrl: imageList[index],
                        )),
              ),
            )
          ],
        );
      },
    );
  }
}
