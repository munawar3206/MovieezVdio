// import 'package:flutter/material.dart';

// class GradientScaffold extends StatelessWidget {
//   final Widget body;
//   final List<Color> gradientColors;

//    GradientScaffold({
//     Key? key,
//     required this.body,
//     required this.gradientColors,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 stops: [0.1, 0.5, 0.7, 0.9],
//                 colors: [
//                   Color.fromARGB(255, 0, 0, 0),
//                   Color.fromARGB(255, 9, 3, 43) ,
//                   Color.fromARGB(255, 1, 4, 68) ,
//                   Color.fromARGB(255, 0, 0, 0) ,
//                 ],
//               ),
//             ),
//         child: body,
//       ),
//     );
//   }
// }
