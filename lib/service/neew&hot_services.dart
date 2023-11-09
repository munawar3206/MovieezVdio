import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';

class NewAndHotServices {
  List<MovieInfoModel> upcomingMovies = [];
  List<MovieInfoModel> moviepopular = [];

  Future fetchUpcomingMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.upcoming);
      upcomingMovies = movies.results;
    } catch (error) {
      print('Error fetching trending movies: $error');
    }
    return upcomingMovies;
  }

  Future fetchMoviePopular() async {
    try {
      final movies = await apiCall(ApiEndPoints.moviepopular);
      moviepopular = movies.results;
    } catch (error) {
  
      print('Error fetching trending movies: $error');
    }
    return moviepopular;
  }
}
