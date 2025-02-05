// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class WidgetFlChart extends StatelessWidget {
//   const WidgetFlChart({
//     super.key,
//     required this.subject,
//     required this.uid,
//     required this.department,
//     required this.year,
//     required this.attendencePercentage,
//     required this.absent, required this.present,
//   });
//   final String subject;
//   final String uid;
//   final String department;
//   final String year;
//   final double attendencePercentage;
//   final int absent;
//   final int present;
//   @override
//   Widget build(BuildContext context) {
//     List<Color> gradientColors = [
//     Color.fromARGB(255,255, 110, 8),
//        Color.fromARGB(255, 9, 1, 39),
//     ];

//     final Size size = MediaQuery.of(context).size;
//     return Center(
//       child: Column(
//         children: [ FutureBuilder<DocumentSnapshot>(
//                   future: FirebaseFirestore.instance
//                       .collection('Student')
//                       .doc(department)
//                       .collection(year)
//                       .doc(uid)
//                       .collection('ListOfSub')
//                       .doc(subject)
//                       .get(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(
//                         child: Text('Document not found'),
//                       );
//                     }

//                     // Access the 'absent' field of the document
//                     var isPresent = snapshot.data?.get('TotalClasses');

//                     // Display the 'absent' field value
//                     return Text("data");
//                   }),
//           SizedBox(
//             width: size.width,
//             height: size.width * .9,
//             child: LineChart(LineChartData(
//                 borderData: FlBorderData(
//                     show: true,
//                     // border: Border.all(color: Colors.white, width: 1),
//                     border: Border(
//                         left: BorderSide(color: Color.fromARGB(111, 255, 111, 8)),
//                         bottom: BorderSide(color: Color.fromARGB(80, 255, 111, 8)),)),
//                 gridData: FlGridData(
//                   show: true,
//                   getDrawingHorizontalLine: (value) {
//                     return FlLine(color: Color.fromARGB(161, 255, 255, 255), strokeWidth: .1);
//                   },
//                   drawVerticalLine: true,
//                   getDrawingVerticalLine: (value) {
//                     return FlLine(color: Color.fromARGB(118, 255, 255, 255), strokeWidth: .2);
//                   },
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 35,
//                       getTextStyles: (context, value) {
//                         return const TextStyle(
//                             color: Color(0xff68737d),
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold);
//                       },
//                       getTitles: (value) {
//                         switch (value.toInt()) {
//                           case 0:
//                             return 'Sep 19';
//                           case 4:
//                             return 'Oct 10';
//                           case 8:
//                             return 'Nov 16';
//                         }
//                         return '';
//                       },
//                       margin: 8),
//                   rightTitles: SideTitles(),
//                   topTitles: SideTitles(),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 35,
//                     getTextStyles: (context, value) {
//                       return const TextStyle(
//                           color: Color(0xff68737d),
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold);
//                     },
//                     getTitles: (value) {
//                       switch (value.toInt()) {
//                         case 0:
//                           return '0';
//                         case 2:
//                           return '50';
//                         case 4:
//                           return '100';
//                         case 6:
//                           return '150';

//                       }
//                       return '';
//                     },
//                     margin: 12,
//                   ),
//                 ),
//                 maxX: 8,
//                 maxY: 8,
//                 minY: 0,
//                 minX: 0,
//                 lineBarsData: [
//                   LineChartBarData(
//                       spots: [
//                         const FlSpot(0, 0),
//                         const FlSpot(5, 7),
//                         const FlSpot(7, 6),
//                         const FlSpot(8, 4),
//                       ],
//                       isCurved: true,
//                       colors: [Colors.black12, Colors.white70, Colors.white],
//                       barWidth: 5,
//                       belowBarData: BarAreaData(
//                           show: true,
//                           colors: gradientColors
//                               .map((e) => e.withOpacity(0.3))
//                               .toList()))
//                 ])),
//           ),
//         ],
//       ),
//     );
//   }
// }
