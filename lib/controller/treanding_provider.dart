import 'package:flutter/material.dart';
import 'package:tmdb/service/download_service.dart';

class TrendingMovieInitializeProvider extends ChangeNotifier{
  List imageList=[];
  bool isLoading=true;

   void initializeImages() async {
 imageList=await DownloadsServices().getTrendingMovies();
         isLoading=false;
         notifyListeners();
    }
  }
