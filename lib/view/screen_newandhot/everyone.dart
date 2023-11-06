
import 'package:flutter/material.dart';
import 'package:tmdb/view/screen_newandhot/new_and_hot.dart';

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

