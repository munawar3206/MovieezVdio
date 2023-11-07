import 'package:flutter/material.dart';
import 'package:tmdb/view/home/screen_home.dart';

class horicard extends StatelessWidget {
  final String imageUrlFromApi;
  const horicard({super.key, required this.imageUrlFromApi});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // height: 20,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrlFromApi), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
