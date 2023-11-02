import 'package:flutter/material.dart';

const image1 =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/9XP8b9vpk7CPAZz58eBo18blaVh.jpg";

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text("New & Hot"),
              elevation: 0,
              actions: const [
                Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: const [
                    Tab(
                      text: "🍿Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone Watching...",
                    )
                  ]),
            ),
          ),
          body: TabBarView(
            children: [
              _buildComingSoon(),
              _buildEveryoneWatching(),
            ],
          )),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const comingsoonwidget());
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const everyonewatching());
  }
}

class everyonewatching extends StatelessWidget {
  const everyonewatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Card(
            child: Image(
              image: NetworkImage(image1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Anime   (2023)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text("⭐⭐⭐⭐"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})")
            ],
          ),
        ),
      ],
    );
  }
}

class comingsoonwidget extends StatelessWidget {
  const comingsoonwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(children: [
            Text(
              "MAR",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              "20",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )
          ]),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: const Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Image(
                        image: NetworkImage(
                            "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/wSxRjSeBjYnlsHtAXTEA0BicsLz.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // color: Colors.amberAccent,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 275,
                    child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(
                          Icons.volume_off,
                          color: Colors.white,
                        )),
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
                        "Friendship Matters",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Coming on Sunday"),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Friendship Matters",
                        style: TextStyle(fontFamily: AutofillHints.addressCity),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                      Text(
                        "Remind Me",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Padding(
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  "Get access to maintain your own custom personal lists, track what you've seen and search and filter for what to watch next—regardless if it's in theatres, on TV or available on popular streaming services like Netflix, Amazon Prime Video, Hotstar, Voot, and Jio Cinema.",
                  style: TextStyle(
                      fontFamily: AutofillHints.addressState,
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
