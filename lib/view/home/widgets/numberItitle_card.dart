import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';
import 'package:tmdb/view/home/widgets/number_card.dart';
import 'package:tmdb/view/widgets/mainTitle.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return FutureBuilder(
      future: apiCall(ApiEndPoints.tvtoprate),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Column(
              children: const [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('Please wait'),
              ],
            ),
          );
        }

        if (snapshot.data == null) {
          return const Center(child: Text('No data found'));
        }

        imageList = snapshot.data!.results.map((MovieInfoModel movieInfo) {
          if (movieInfo.posterPath == null) {
            return null;
          }
          String imageUrl =
              'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
          return imageUrl;
        }).toList();

        if (imageList.isEmpty) {
          return const Center(child: ListTile(title: Text('No Movies Found')));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainTitle(title: "Top 10 Today Hits"),
            SizedBox(
              height: 10,
            ),
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
