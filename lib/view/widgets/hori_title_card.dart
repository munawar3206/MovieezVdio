import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';
import 'package:tmdb/service/base_client.dart';
import 'package:tmdb/view/widgets/horiCard.dart';
import 'package:tmdb/view/widgets/mainTitle.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title, required this.apiUrl});

  final String title;
  final String apiUrl;

  @override
  Widget build(BuildContext context) {
    List imageList = [];
    return FutureBuilder(
      future: apiCall(apiUrl),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          Center(
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
          return const Text('No data found');
        }

        if (snapshot.hasData) {
          imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
            if (movieInfo.posterPath == null) {
              return null;
            }
            String imageUrl =
                'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
            return imageUrl;
          }).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTitle(title: title),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 120,
              // width: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => horicard(
                  imageUrlFromApi: imageList[index],
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
