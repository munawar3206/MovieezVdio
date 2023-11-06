import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';
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
          child: FutureBuilder(
              future: apiCall(ApiEndPoints.trendingMovies),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                        Text('Please wait'),
                      ],
                    ),
                  );
                }
                if (snapshot.data == null) {
                  return const Text("No data found");
                }
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(
                    20,
                    (index) {
                      return TopSearchtile(
                        movieInfo: snapshot.data.results[index],
                      );
                    },
                  ),
                );
              }),
        )
      ],
    );
  }
}

class TopSearchtile extends StatelessWidget {
  const TopSearchtile({super.key, required this.movieInfo});
  final MovieInfoModel movieInfo;
  @override
  Widget build(BuildContext context) {
    String url =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey';

    // final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
      // child: Center(
      //   child: Text(
      //     movieInfo.title ?? "",
      //     style: TextStyle(
      //         color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
      //   ),
      // ),
    );
  }
}
