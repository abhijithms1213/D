// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:giffy_dialog/giffy_dialog.dart';

// class WidgetApplyButton extends StatefulWidget {
//   const WidgetApplyButton({
//     Key? key,
//     required this.width,
//     required this.height,
//   }) : super(key: key);

//   final double width;
//   final double height;

//   @override
//   _WidgetApplyButtonState createState() => _WidgetApplyButtonState();
// }

// class _WidgetApplyButtonState extends State<WidgetApplyButton> {
//   bool isApplied = false;
//   bool isLoading = false;
//   Key loadingKey = UniqueKey();
//   Key completedKey = UniqueKey();
//   final CollectionReference applybutton =
//       FirebaseFirestore.instance.collection('newjobs');

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: isApplied
//           ? Container() // If applied, don't show the button
//           : InkWell(
//               onTap: () {
//                 dialogue(context);
//               },
//               child: Container(
//                 width: widget.width * 1,
//                 height: widget.height * 0.05,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 66, 32, 178),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                   child: Text(
//                     isApplied ? "Applied" : "Apply Now",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   void dialogue(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return GiffyDialog.image(
//               isLoading
//                   ? Image.network(
//                       "https://i.pinimg.com/originals/8a/2e/4c/8a2e4c79a1b9c983dc6bf8d6cbada43a.gif",
//                       key: loadingKey,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     )
//                   : isApplied
//                       ? Image.network(
//                           "https://cdn.dribbble.com/users/3050354/screenshots/14646894/media/1f31948afd5401c44d4bae934f07641a.gif",
//                           key: completedKey,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         )
//                       : Image.network(
//                           "https://media2.giphy.com/media/26ufm7oRbWQG7LXaY/giphy.gif",
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//               title: const Text(
//                 '\nCONFIRMATION!',
//                 textAlign: TextAlign.center,
//               ),
//               content: isLoading
//                   ? const Text(
//                       'working on it...',
//                       textAlign: TextAlign.center,
//                     )
//                   : isApplied
//                       ? const Text(
//                           'Completed!',
//                           textAlign: TextAlign.center,
//                         )
//                       : const Text(
//                           'Are you sure you want to apply for this job?',
//                           textAlign: TextAlign.center,
//                         ),
//               actions: isLoading
//                   ? []
//                   : isApplied
//                       ? [
//                           // If applied, only show the "OK" button
//                           TextButton(
//                             onPressed: () => Navigator.pop(context, 'OK'),
//                             child: const Text('OKey'),
//                           ),
//                         ]
//                       : [
//                           // Initial state buttons
//                           TextButton(
//                             onPressed: () => Navigator.pop(context, 'CANCEL'),
//                             child: const Text(
//                               'CANCEL',
//                               style: TextStyle(color: Color.fromARGB(255, 132, 18, 9)),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 isApplied = true;
//                                 isLoading = true;
//                               });
//                               Future.delayed(const Duration(seconds: 3), () {
//                                 setState(() {
//                                   isLoading = false;
//                                 });
//                               });
//                             },
//                             child: Container(
//                               width: 60,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(79, 15, 169, 35),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   'OK',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//               entryAnimation: EntryAnimation.bottom,
//               giffyPadding: const EdgeInsets.all(0),
//             );
//           },
//         );
//       },
//     );
//   }
// }
