import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/controller/internet_connectivity.dart';
import 'package:tmdb/controller/new_and_hot_provider.dart';
import 'package:tmdb/view/screen_newandhot/everyone.dart';

class EveryonesWatchingWidget extends StatefulWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  State<EveryonesWatchingWidget> createState() =>
      _EveryonesWatchingWidgetState();
}

class _EveryonesWatchingWidgetState extends State<EveryonesWatchingWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewAndHotProvider>(context, listen: false)
        .fetchEveryoneWatchingMovies();
     Provider.of<InternetConnectivityProvider>(context,listen: false).getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAndHotProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.moviepopular.isEmpty) {
          return const Text("No data available");
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => Everyonewatching(
            movieInfo: provider.moviepopular[index],
          ),
        );
      },
    );
  }
}
