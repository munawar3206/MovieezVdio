import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/view/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final List imageList = [
    "https://image.tmdb.org/t/p/original/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
    "https://3.bp.blogspot.com/-pxFlnDXRgZ8/WxYjnuD4QlI/AAAAAAAAEpk/wCo4GcIzgbUQDQUkEBll0nOMZ4ZvZy3BwCLcBGAs/s640/tekken_blood_vengance.jpg",
    "https://th.bing.com/th/id/OIP.ue7i_g511Nfb8zQZ7MSpJgHaNK?pid=ImgDet&w=800&h=1422&rs=1",
  ];

  @override
  Widget build(BuildContext context) {
    //  final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            ),
          ),
          body: SizedBox(
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Smart Downloads")
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                // const Text("No video downloaded"),
                Center(
                    child: Text(
                  "Introducing Downloads for You",
                  style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 6, 0, 30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.28,
                        backgroundColor: Colors.grey,
                      ),
                      Downloadsimagewidgets(
                        imageList: imageList[0],
                        margin: EdgeInsets.only(left: 130, bottom: 50),
                        angle: 20,
                        size: Size(MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.width * 0.58),
                      ),
                      Downloadsimagewidgets(
                        imageList: imageList[1],
                        margin: EdgeInsets.only(right: 130, bottom: 50),
                        angle: -20,
                        size: Size(MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.width * 0.68),
                      ),
                      Downloadsimagewidgets(
                        imageList: imageList[2],
                        margin: EdgeInsets.only(bottom: 18),
                        size: Size(MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.width * 0.64),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Find Videos to Downloads",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: const Text(
                    "Manage",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class Downloadsimagewidgets extends StatelessWidget {
  const Downloadsimagewidgets(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    // print(imageList);
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
