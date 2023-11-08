import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/controller/download_provider.dart';
import 'package:tmdb/controller/internet_connectivity.dart';


class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.download_rounded,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(" Downloads")
      ],
    );
  }
}

class CenterSection extends StatefulWidget {
  CenterSection({super.key});

  @override
  State<CenterSection> createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DownloadScreenProvider>(context, listen: false)
        .initializeImage();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        const Text.rich(
          TextSpan(text: "No downloads !  ", children: [
            TextSpan(text: "Download Now.", style: TextStyle(color: Colors.red))
          ]),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Consumer<DownloadScreenProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (value.imagelist.isEmpty) {
                return const Text("No data available");
              } else {
                return Stack(
                  alignment: Alignment.center,
                  children: value.imagelist.length < 3
                      ? []
                      : [
                          CircleAvatar(
                            radius: size.width * 0.37,
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                          ),
                          DownloadsImageWidget(
                            imageList: value.imagelist[0],
                            margin: const EdgeInsets.only(left: 170, top: 38),
                            angle: 25,
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                          DownloadsImageWidget(
                            imageList: value.imagelist[5],
                            margin: const EdgeInsets.only(left: 170, top: 178),
                            angle: 25,
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                          DownloadsImageWidget(
                            imageList: value.imagelist[1],
                            margin: const EdgeInsets.only(right: 170, top: 38),
                            angle: -25,
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                          DownloadsImageWidget(
                            imageList: value.imagelist[4],
                            margin: const EdgeInsets.only(right: 170, top: 178),
                            angle: -25,
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                          DownloadsImageWidget(
                            imageList: value.imagelist[2],
                            margin: const EdgeInsets.only(bottom: 25, top: 38),
                            size: Size(size.width * 0.4, size.width * 0.6),
                            radius: 8,
                          ),
                          DownloadsImageWidget(
                            imageList: value.imagelist[3],
                            margin: const EdgeInsets.only(bottom: 25, top: 178),
                            size: Size(size.width * 0.4, size.width * 0.6),
                            radius: 8,
                          ),
                        ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 450,
          child: MaterialButton(
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {},
            child: const Text(
              "Downloads",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 450,
          child: MaterialButton(
            color: Color.fromARGB(255, 0, 47, 235),
            onPressed: () {},
            child: const Text(
              "Top Suggestions For you",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.size,
    this.angle = 0,
    this.radius = 10,
    required EdgeInsets this.margin,
  });
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageList))),
          ),
        ),
      ),
    );
  }
}
