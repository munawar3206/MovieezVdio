import 'package:flutter/cupertino.dart';

class SearchQueryProvider extends ChangeNotifier{
  String query='';


  // String get query=>_query;

  void updateQuery(String newQuery){
    query=newQuery;
    notifyListeners();
  }
}