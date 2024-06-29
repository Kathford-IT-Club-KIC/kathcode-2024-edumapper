// import 'package:flutter/material.dart';
// import 'package:hackathon_project/constants/height.dart';

// class PostContainer extends StatelessWidget {
//   final Post post;
//   const PostContainer({super.key, this.post});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       margin: const  EdgeInsets.symmetric(vertical: 5),
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           _PostHeader(post:post),

//         ],
//       ),
//     );
//   }
// }

// class _PostHeader extends StatelessWidget {
//   final Post post;
//   const _PostHeader(
//     this.post
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ProfileAvatar(image:Image),
//         const SizedBox(height: TAppHeight.formheight-5),
//         Column(
//           children: [
//             Text(""),
//             Icon(
//               Icons.public,
//               color: Colors.grey[100],
//               size: 12,
//             )
//           ],
//         ),
//         IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
//       ],
//     );
//   }
// }