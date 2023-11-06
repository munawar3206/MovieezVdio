import 'package:flutter/material.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';
import 'package:tmdb/view/screen_newandhot/coming_soon.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
     
    return FutureBuilder(
      future:apiCall(ApiEndPoints.upcoming),
       builder: (context, snapshot) {
         if(!snapshot.hasData){
          const Center(
            child: Column(
              children: [
                 CircularProgressIndicator(color: Colors.blue,),
                          Text('Please wait'),

              ],
            ),
          );
         }

         if(snapshot.data==null){
          return const Text('No data found');

         }

         return ListView.builder(
          itemCount: snapshot.data.results.length,
          itemBuilder:(
            
            context, index) =>comingsoonwidget (movieInfo: snapshot.data.results[index],),);
       },);
  }
}

