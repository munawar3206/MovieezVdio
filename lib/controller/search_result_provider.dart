import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/searchresult_services.dart';

class SearchResultProvider extends ChangeNotifier{
   List<MovieInfoModel>searchResultMovies=[];
   
   

   Future fetchSearchResult(String apiQuery)async{
    searchResultMovies=await SearchResultServices().fetchSearchResultMovies(apiQuery);
    notifyListeners();
   }

  of(BuildContext context, {required bool lisen}) {}
}