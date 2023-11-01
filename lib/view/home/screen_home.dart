import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/view/home/widgets/hori_title_card.dart';
import 'package:tmdb/view/home/widgets/number_card.dart';
import 'package:tmdb/view/search/widget/title.dart';
import 'package:tmdb/view/widgets/app_bar_widget.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/oFSQEG1lJTTISj3QKB7cJ9ANkFw.jpg";
List<String> imageUrl1 = [
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/ykNV162Ks90K6kC5lw9GcjlymiR.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/1KgXxv6tHXOnakqYvMPvFwYKWiw.jpg"
];

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "MovieZ Vdio",
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        viewportFraction: 1.0),
                    items: imageUrl1.map((url) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.verified),
                      label: const Text(
                        "Free Trail Of Premium",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Share",
                          style: TextStyle(color: Colors.white),
                        ))),
                Positioned(
                  top: 90,
                  left: 135,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle_outline_rounded,
                        size: 75,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: horititlecard(
                title: "Adventure and Action Movies",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: horititlecard(title: "Drama Movies"),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: texttile(title: "Top Series"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                const SizedBox(
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
                            )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: horititlecard(
                title: "Mystery and Triller Movie",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: horititlecard(
                title: "Watch in your languages",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: horititlecard(
                title: "Horror Movie",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
