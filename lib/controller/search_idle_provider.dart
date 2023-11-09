import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/searchidle_service.dart';

class SearchidleProvider extends ChangeNotifier{
  List<MovieInfoModel> trendingMovies=[];
  bool isLoading=true;

Future fetchSearchIDLMovies()async{
trendingMovies=await SearchidleServices().fetchSearchMovies();
isLoading=false;
notifyListeners();

} 

}