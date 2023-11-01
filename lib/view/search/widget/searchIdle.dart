import 'package:flutter/material.dart';
// import 'package:tmdb/view/search/widget/serch_result.dart';
import 'package:tmdb/view/search/widget/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg";

@override
class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        texttile(title: "Today Top Searches"),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: SizedBox(
                height: 50,
                width: 80,
                child: Center(
                  child: Text(
                    "Trending",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                height: 50,
                width: 80,
                child: Center(
                  child: Text(
                    "Hollywood",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                height: 50,
                width: 80,
                child: Center(
                  child: Text(
                    "Cartoon",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                height: 50,
                width: 80,
                child: Center(
                  child: Text(
                    "Explore More",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1 / 1.5,
          children: List.generate(20, (index) {
            return TopSearchtile();
          }),
        ))
      ],
    );
  }
}

class TopSearchtile extends StatelessWidget {
  const TopSearchtile({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Center(
        child: Text(
          "Off%",
          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontSize: 20),
        ),
      ),
    );
  }
}





