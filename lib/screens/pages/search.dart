// import 'package:flutter/material.dart';

// class AnimatedSearchBar extends StatefulWidget {
//   final Function(String) onSearch;
//   const  AnimatedSearchBar({super.key, required this.onSearch});
//   @override
//   // ignore: library_private_types_in_public_api
//   _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
// }

// class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
//   final TextEditingController _controller = TextEditingController();
//   bool _isSearching = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       if (_controller.text.isNotEmpty) {
//         widget.onSearch(_controller.text);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       curve: Curves.easeIn,
//       duration: const Duration(milliseconds: 300),
//       width: _isSearching ? 290.0 : 48,
//       height: 50.0,
//       alignment: _isSearching ? Alignment.centerLeft : Alignment.centerRight,
//       child: Row(
//         children: <Widget>[
//           IconButton(
//             alignment: Alignment.center,
//             icon: Icon(
//               _isSearching ? Icons.close : Icons.search,
//               size: 25,
//               color: const Color.fromARGB(255, 255, 255, 255),
//             ),
//             onPressed: () {
//               setState(() {
//                 _isSearching = !_isSearching;
//                 if (!_isSearching) {
//                   _controller.clear();
//                 }
//               });
//             },
//           ),
//           Expanded(
//             child: _isSearching
//                 ? TextField(
//                     controller: _controller,
//                     onChanged: (value) {
//                       widget.onSearch(value);
//                     },
//                     decoration: const InputDecoration(
//                       hintText: 'Search...',
//                       hintStyle:
//                           TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                       border: InputBorder.none,
//                     ),
//                     style: const TextStyle(color: Colors.white),
//                   )
//                 : const SizedBox.shrink(),
//           ),
//         ],
//       ),
//     );
//   }
// }