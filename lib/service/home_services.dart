import 'package:flutter/material.dart';
import 'package:tmdb/model/movie_info.dart';
import 'package:tmdb/service/api_key.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';

// class HomeBackgroundCardServices{
//   String? imageUrl;

//    setImage()async{
//     dynamic result=await apiCall(ApiEndPoints.moviepopular);

//         if(result.results.isNotEmpty){
//       MovieInfoModel movieInfo =result.results[3];
//       imageUrl =
//             "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apikey";

//            return imageUrl;
//     }

//   }
// }
class HomeScrollProvider extends ChangeNotifier {
  bool isScrolling = true;

  void setIsScrolling(bool value) {
    isScrolling = value;
    notifyListeners();
  }
}
