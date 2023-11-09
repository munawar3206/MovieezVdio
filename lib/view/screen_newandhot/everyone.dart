import 'package:flutter/material.dart';
import 'package:tmdb/consnants/color.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';

class Everyonewatching extends StatelessWidget {
  const Everyonewatching({super.key, required this.movieInfo});
  final MovieInfoModel movieInfo;
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';
    return Column(
      children: [
       k10,
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Stack(children: [
            Container(
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.watch_later_rounded),
                color: Colors.white,
              ),
            )
          ]),
        ),
       k10,
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieInfo.originalTitle ?? "No  Title Found",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                      color: kwhite)
                ],
              ),
              Text(movieInfo.releaseDate ?? ""),
            k10,
              Text(movieInfo.overview),
            ],
          ),
        ),
      ],
    );
  }
}
