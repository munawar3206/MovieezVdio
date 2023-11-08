import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/tvtoperate.dart';

class TvTopRateProvider extends ChangeNotifier{

 List<MovieInfoModel> tvTopRate=[];
  bool isLoading=true;

Future fetchTvTopRateMovies()async{
tvTopRate=await TVTopRateServices().fetchTVTopRateMovies();
isLoading=false;
notifyListeners();

} 

}