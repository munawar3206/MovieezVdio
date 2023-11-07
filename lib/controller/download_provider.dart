import 'package:flutter/material.dart';
import 'package:tmdb/service/download_service.dart';

class DownloadScreenProvider extends ChangeNotifier{
 List imagelist =[];
bool isLoading =true;

TrandingMovieInitializeProvider(){
  initializeImage();
 }

void initializeImage()async{
  imagelist =await DownloadsServices().getTrendingMovies();
  isLoading=false;
  notifyListeners();
}

}