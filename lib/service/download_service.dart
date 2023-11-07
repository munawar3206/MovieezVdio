import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/model/tmdb_api_response.dart';
import 'package:tmdb/service/api_key.dart';
import 'package:tmdb/service/apiendpoint.dart';

class DownloadsServices {
  
  Future<List<String>> getTrendingMovies() async {
   try {
    List<String> imageList =[];
     final response = await http.get(Uri.parse(ApiEndPoints.trendingMovies));
    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      TMDBApiResponseModel tmdbApiResponse =
          TMDBApiResponseModel.fromjson(data);

          for(MovieInfoModel movieInfo in tmdbApiResponse.results){
             if (movieInfo.posterPath != null) {
            imageList.add('https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey');
          }
          }
      return imageList;
    } else {
      return [];
    }
     
   } catch (e) {
    return [];
     
   }
  }
}
