import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';

class comingsoonwidget extends StatelessWidget {
  final MovieInfoModel movieInfo;

  const comingsoonwidget({
    super.key,
    required this.movieInfo,
  });

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey";
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(children: [
            Text(
              fetchDate(movieInfo.releaseDate!),
              style: const TextStyle(
                  fontSize: 28, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            // Text(
            //   fetchDate(movieInfo.releaseDate!),
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            // )
          ]),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Image(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // color: Colors.amberAccent,
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 280,
                    child: Icon(
                      CupertinoIcons.volume_off,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieInfo.originalTitle ?? " ",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w100),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(text: "Coming On   ", children: [
                          TextSpan(
                              text: fetchDay(movieInfo.releaseDate!),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 18))
                        ]),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        movieInfo.originalTitle ?? "",
                        style: const TextStyle(
                            fontFamily: AutofillHints.addressCity),
                      )
                    ],
                  ),
                  // const Column(
                  //   children: [
                  //     Icon(
                  //       Icons.notifications_none,
                  //       color: Colors.white,
                  //     ),
                  //     Text(
                  //       "Remind Me",
                  //       style: TextStyle(
                  //         fontSize: 10,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        Text(
                          "Info",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                movieInfo.overview,
                style: const TextStyle(
                    fontFamily: AutofillHints.addressState, color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }

  String fetchDate(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");
    return "${formatDate.first.substring(0, 3)} \n${formatDate.last}";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
