import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int navSelectedIndex = 0;

// Icons for navbar
List<IconData> navIcons = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.magnifyingGlass,
  FontAwesomeIcons.solidHeart,
  FontAwesomeIcons.gear,
];


// floating nav idk it may be useful 
// Widget _navBar() {
//     return Positioned(
//       bottom: 4,
//       left: 2,
//       right: 2,
//       child: Container(
//         height: 60,
//         margin: EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 20,
//               spreadRadius: 2,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: navIcons.map((icon) {
//             int index = navIcons.indexOf(icon);
//             bool isSelected = navSelectedIndex == index;
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   navSelectedIndex = index;
//                 });
//               },
//               child: Material(
//                 color: Colors.transparent,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: Icon(
//                     icon,
//                     size: 28,
//                     color: isSelected
//                         ? const Color.fromARGB(255, 0, 0, 0)
//                         : Color.fromRGBO(156, 156, 156, 1),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }