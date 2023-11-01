import 'package:flutter/material.dart';
import 'package:tmdb/view/search/widget/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/rDzig50dj7VpLwJ7SThbamETK1G.jpg";

class SeachResultWidget extends StatelessWidget {
  const SeachResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        texttile(
          title: "Movie & Tv",
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 7,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
          children: List.generate(20, (index) {
            return MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
