import 'package:tmdb/model/movie_info.dart';

class TMDBApiResponseModel{
  int page=0;
  List<MovieInfoModel>results=[];
  int totalPages=0;
  int totalResults=0;

  TMDBApiResponseModel.fromjson(Map data){
    page=data['page'];
       results = (data['results'] as List)
        .map((item) => MovieInfoModel.fromjson(item))
        .where((movieInfo) => movieInfo != null) 
        .toList();
    totalPages=data['total_pages'];
    totalResults=data['total_results'];
  }

  Map<String,dynamic>tojson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pges']=page;
    data['results']=results.map((MovieInfoModel movieInfo)=>movieInfo.tojson()).toList();
    data['total_pages']=totalPages;
    data['total_results']=totalResults;
    return data;
  }
}