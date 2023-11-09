import 'package:flutter/material.dart';
import 'package:tmdb/consnants/color.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 10,
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),

          // style: GoogleFonts.montserrat().copyWith(fontSize: 20),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: kwhite,
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.person,
          color:kwhite,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
