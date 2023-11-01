import 'package:flutter/material.dart';

class texttile extends StatelessWidget {
  final String title;
  texttile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
