import 'package:flutter/material.dart';
import 'package:tmdb/view/downloads/widget/screen_downloads.dart';
import 'package:tmdb/view/widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});
  final widgetList = [
    const SmartDownloads(),
    CenterSection(),
    const BottomSection(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBarWidget(
                title: "Downloads",
              )),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Color.fromARGB(255, 0, 0, 0) ?? Colors.blue,
                  Color.fromARGB(255, 9, 3, 43) ?? Colors.blue,
                  Color.fromARGB(255, 1, 4, 68) ?? Colors.blue,
                  Color.fromARGB(255, 0, 0, 0) ?? Colors.blue,
                ],
              ),
            ),
            child: ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) => widgetList[index],
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: widgetList.length),
          )),
    );
  }
}
