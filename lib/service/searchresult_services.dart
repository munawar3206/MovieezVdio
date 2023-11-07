import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';

class SearchResultServices{
  List<MovieInfoModel>searchResultMovies=[];

  Future fetchSearchResultMovies(String apiQuery)async{
    try {
      final movies=await apiCall(ApiEndPoints.searchmovie + apiQuery);
      searchResultMovies=movies.results;
      
    } catch (error) {
      print("Error fetching trendng movies:$error");
    }
    return searchResultMovies;
  }
}