import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/view/main_page/widgets/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 0, 1, 25)),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 2, 0, 16),
        fontFamily: GoogleFonts.acme().fontFamily,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: ScreenMainPage(),
    );
  }
}
