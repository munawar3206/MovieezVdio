import 'package:tmdb/consnants/base_url.dart';
import 'package:tmdb/service/api_key.dart';

class ApiEndPonts {
  static const trendingMovies = "$kbaseUrl/trending/all/day?api_key=$apikey";
    static const searchmovie = '$kbaseUrl/search/movie?api_key=$apikey&query=';
    static const upcoming =
      "$kbaseUrl/movie/upcoming?api_key=$apikey&language=en-US&page=1"; 
     static const moviepopular =
      '$kbaseUrl/movie/popular?api_key=$apikey&language=en-US&page=1';  
    static const tvpopular =
      "$kbaseUrl/tv/popular?api_key=$apikey&language=en-US&page=1";
     static const tvtoprate =
      '$kbaseUrl/discover/tv?include_adult=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=200&api_key=$apikey';
}
