import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/controller/internet_connectivity.dart';
import 'package:tmdb/controller/new_and_hot_provider.dart';
import 'package:tmdb/service/apiendpoint.dart';
import 'package:tmdb/service/base_client.dart';
import 'package:tmdb/view/screen_newandhot/coming_soon.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewAndHotProvider>(context, listen: false)
        .fetchComingSoonMovies();
     Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiCall(ApiEndPoints.upcoming),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Color.fromARGB(255, 243, 33, 33),
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
          itemCount: snapshot.data.results.length,
          itemBuilder: (context, index) => comingsoonwidget(
            movieInfo: snapshot.data.results[index],
          ),
        );
      },
    );
  }
}
