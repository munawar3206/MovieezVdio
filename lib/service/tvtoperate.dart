
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';

class TVTopRateServices{

   List<MovieInfoModel> tvtoprate = [];

  Future fetchTVTopRateMovies() async {
    try {
      final movies = await apiCall(ApiEndPoints.tvtoprate);
      tvtoprate = movies.results;
    } catch (error) {
   
      print('Error fetching trending movies: $error');
    }
    return tvtoprate;
  }
}