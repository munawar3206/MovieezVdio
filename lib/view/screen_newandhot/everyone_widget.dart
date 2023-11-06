import 'package:flutter/material.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';
import 'package:tmdb/view/screen_newandhot/everyone.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiCall(ApiEndPoints.moviepopular),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('Please wait'),
              ],
            ),
          );
        }
        if (snapshot.data == null) {
          return const Text('No data found');
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => Everyonewatching(
            movieInfo: snapshot.data.results[index],
          ),
        );
      },
    );
  }
}
