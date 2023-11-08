import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/consnants/base_url.dart';

class bigScreen extends StatelessWidget {
  const bigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                imagePath1,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                left: 330,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.volume_off,
                        color: Color.fromARGB(255, 255, 255, 255)))),
            Positioned(
              top: 30,
              left: 330,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.captions_bubble_fill,
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
            Positioned(
              left: 340,
              bottom: 10,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(201, 0, 0, 0)),
                  // color: Color.fromARGB(181, 0, 0, 0),
                  height: 15,
                  width: 25,
                  child: const Text("  2:24")),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/giUBXYnDAaJgNqA6iE3BMVE2EHp.jpg"),
              radius: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Carol Danvers, Together, this unlikely trio must team up and learn to work in concert to save the universe.",
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("NovaMedia"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("2.3M views"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("6 hours ago")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
