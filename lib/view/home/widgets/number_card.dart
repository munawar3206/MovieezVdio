import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/consnants/color.dart';


class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});

  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          top: 100,
          child: BorderedText(
            strokeColor:kwhite,
            strokeWidth: 8.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 5, 0, 62),
                  fontSize: 100,
                  decorationColor:kblack,
                  decoration: TextDecoration.none),
            ),
          ),
        )
      ],
    );
  }
}
