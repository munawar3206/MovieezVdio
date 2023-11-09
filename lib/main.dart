import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/controller/download_provider.dart';
import 'package:tmdb/controller/internet_connectivity.dart';
import 'package:tmdb/controller/new_and_hot_provider.dart';
import 'package:tmdb/controller/search_idle_provider.dart';
import 'package:tmdb/controller/search_provider.dart';
import 'package:tmdb/controller/search_result_provider.dart';
import 'package:tmdb/controller/tvtoperate_provider.dart';
import 'package:tmdb/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DownloadScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchQueryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchidleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchResultProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewAndHotProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TvTopRateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 0, 0, 0)),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          fontFamily: GoogleFonts.agdasima().fontFamily,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
