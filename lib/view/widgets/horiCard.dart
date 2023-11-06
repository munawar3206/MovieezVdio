import 'package:flutter/material.dart';
import 'package:tmdb/view/home/screen_home.dart';

class horicard extends StatelessWidget {
  final String imageUrlFromApi;
  const horicard({super.key, required this.imageUrlFromApi});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 120,
      decoration: BoxDecoration(
          image: const DecorationImage(image: NetworkImage(imageUrl)),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
