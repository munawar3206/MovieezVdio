
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';

class SearchidleServices {
  List<MovieInfoModel> trendingMovies = [];

  Future fetchSearchMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.trendingMovies);
      trendingMovies = movies.results;
    } catch (error) {

      print('Error fetching trending movies: $error');
    }
    return trendingMovies;
  }
}
