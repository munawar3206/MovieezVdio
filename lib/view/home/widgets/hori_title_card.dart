// import 'package:flutter/material.dart';
// import 'package:tmdb/view/widgets/horiCard.dart';
// import 'package:tmdb/view/widgets/mainTitle.dart';

// class horititlecard extends StatelessWidget {
//   const horititlecard({
//     super.key,
//     required this.title,
//   });
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             MainTitle(title: title),
//             const SizedBox(
//               width: 5,
//             ),
//             const Icon(
//               Icons.arrow_forward_ios,
//               color: Color.fromARGB(255, 255, 255, 255),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         LimitedBox(
//           maxHeight: 120,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: List.generate(10, (index) => const horicard()),
//           ),
//         )
//       ],
//     );
//   }
// }
