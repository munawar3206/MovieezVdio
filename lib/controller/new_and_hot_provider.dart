import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/neew&hot_services.dart';

class NewAndHotProvider extends ChangeNotifier {
  List<MovieInfoModel> upcomingMovies = [];
  List<MovieInfoModel> moviepopular = [];
  bool isLoading = true;

  Future fetchComingSoonMovies() async {
    upcomingMovies = await NewAndHotServices().fetchUpcomingMovies();
    isLoading = false;
    notifyListeners();
  }

  Future fetchEveryoneWatchingMovies() async {
    moviepopular = await NewAndHotServices().fetchMoviePopular();
    isLoading = false;
    notifyListeners();
  }
}
