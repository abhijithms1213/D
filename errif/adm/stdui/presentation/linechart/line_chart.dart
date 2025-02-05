import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WidgetFlChart extends StatelessWidget {
  const WidgetFlChart({
    super.key,
    required this.subject,
    required this.uid,
    required this.department,
    required this.year,
    required this.attendencePercentage,
    required this.absent,
    required this.present,
  });
  final String subject;
  final String uid;
  final String department;
  final String year;
  final double attendencePercentage;
  final int absent;
  final int present;
  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      Color.fromARGB(255, 255, 110, 8),
      Color.fromARGB(255, 9, 1, 39),
    ];

    final Size size = MediaQuery.of(context).size;
    final CollectionReference linechart = FirebaseFirestore.instance
        .collection('Student')
        .doc(department)
        .collection(year)
        .doc(uid)
        .collection('ListOfSub')
        .doc(subject)
        .collection('graph');
    return Center(
      child: Column(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: linechart
                  .orderBy(
                    'dateandperiod',
                  )
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                // Extract the status and date values from the documents
                final List<DocumentSnapshot> documents =
                    snapshot.data?.docs ?? [];
                final List<int> statusList =
                    documents.map((doc) => doc.get('status') as int).toList();
                final List<String> dateList =
                    documents.map((doc) => doc.get('date') as String).toList();
                final List<String> dateandperiod = documents
                    .map((doc) => doc.get('dateandperiod') as String)
                    .toList();
                     final List<String> periodListing =
                    documents.map((doc) => doc.get('period') as String).toList();
                final List<String> periodList = [];

                return SizedBox(
                  width: size.width,
                  height: size.width * .9,
                  child: LineChart(LineChartData(
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        left:
                            BorderSide(color: Color.fromARGB(111, 255, 111, 8)),
                        bottom:
                            BorderSide(color: Color.fromARGB(80, 255, 111, 8)),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Color.fromARGB(161, 255, 255, 255),
                          strokeWidth: .1,
                        );
                      },
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Color.fromARGB(118, 255, 255, 255),
                          strokeWidth: .2,
                        );
                      },
                    ),
                    //bottom tile

                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTextStyles: (context, value) {
                          return const TextStyle(
                            color: Color(0xff68737d),
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          );
                        },
                        getTitles: (value) {
                          final int index = value.toInt();
                          if (index >= 0 && index < dateandperiod.length) {
                            return "${dateList[index]} ${periodListing[index]}";
                          }
                          return '';
                        },
                        margin: 8,
                      ),
                      rightTitles: SideTitles(),
                      topTitles: SideTitles(),
                      leftTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTextStyles: (context, value) {
                          return const TextStyle(
                            color: Color(0xff68737d),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          );
                        },
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return '';
                            case 2:
                              return '';
                            case 4:
                              return '';
                            case 6:
                              return '';
                          }
                          return '';
                        },
                        margin: 12,
                      ),
                    ),
                    maxX: dateList.length.toDouble() -
                        1, // Adjust the maximum X value based on the number of dates
                    maxY: 7,
                    minY: 0,
                    minX: 0,
                    lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(tooltipBgColor: Color.fromARGB(189, 255, 255, 255)),
                      touchCallback: (FlTouchEvent touchEvent,
                          LineTouchResponse? touchResponse) {
                            
                        if (touchEvent is FlTapUpEvent &&
                            touchResponse != null) {
                          final List<LineBarSpot>? touchedSpots =
                              touchResponse.lineBarSpots;
                          if (touchedSpots!.isNotEmpty) {
                            final int index =
                                touchedSpots.first.spotIndex.toInt();
                            // Perform actions based on the tapped spot at the index
                            final String period = periodList[index];
                            if (period.isNotEmpty) {
                              // showDialog(
                              //   context: context,
                              //   builder: (context) {
                              //     return AlertDialog(
                              //       title: Text('Period'),
                              //       content: Text('$period from ${dateList[index]}'),
                              //       actions: [
                              //         TextButton(
                              //           onPressed: () {
                              //             Navigator.of(context).pop();
                              //           },
                              //           child: Text('OK'),
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // );
                                ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$period from ${dateList[index]}'),));
                            }
                          }
                        }
                      },
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: List.generate(statusList.length, (index) {
                          final double x = index.toDouble();
                          final double y = statusList[index].toDouble();
                          if (index > 0 && statusList[index - 1] == y - 1) {
                            periodList.add(documents[index].get('period'));
                          } else {
                            periodList.add(
                                ''); // Add an empty string if not decremented by 1
                          }
                          return FlSpot(x, y);
                        }),
                        isCurved: true,
                        colors: [
                          Colors.black12,
                          Colors.white70,
                          Colors.white,
                        ],
                        barWidth: 5,
                        belowBarData: BarAreaData(
                          show: true,
                          colors: gradientColors
                              .map((e) => e.withOpacity(0.3))
                              .toList(),
                        ),
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            if (spot.x == null || spot.y == null) {
                              return FlDotCirclePainter(
                                radius: 0,
                                color: Colors.transparent,
                              );
                            }
                            final int spotIndex = spot.x.toInt();
                            final String period = periodList[spotIndex];
                            final bool showPeriod = period.isNotEmpty;

                            return FlDotCirclePainter(
                              radius: showPeriod ? 4 : 2,
                              color: showPeriod ? Colors.red : Colors.blue,
                              strokeColor: Colors.white,
                              strokeWidth: 2,
                            );
                          },
                          
                        ),
                      ),
                    ],

                    // lineBarsData: [
                    //   LineChartBarData(
                    //     spots: List.generate(statusList.length, (index) {
                    //       final double x = index.toDouble();
                    //       final double y = statusList[index].toDouble();
                    //       if (index > 0 && statusList[index - 1] == y - 1) {
                    //         periodList.add(documents[index].get('period'));
                    //       } else {
                    //         periodList.add(
                    //             ''); // Add an empty string if not decremented by 1
                    //       }
                    //       return FlSpot(x, y);
                    //     }),
                    //     isCurved: true,
                    //     colors: [
                    //       Colors.black12,
                    //       Colors.white70,
                    //       Colors.white,
                    //     ],
                    //     barWidth: 5,
                    //     belowBarData: BarAreaData(
                    //       show: true,
                    //       colors: gradientColors
                    //           .map((e) => e.withOpacity(0.3))
                    //           .toList(),
                    //     ),
                    //   ),
                    // ],
                    //  lineTouchData: LineTouchData(
                    //    touchCallback: (LineTouchResponse touchResponse){}
                    // ),
                  )),
                );
              }),
        ],
      ),
    );
  }
}

    // SizedBox(
          //   width: size.width,
          //   height: size.width * .9,
          //   child: LineChart(LineChartData(
          //       borderData: FlBorderData(
          //           show: true,
          //           // border: Border.all(color: Colors.white, width: 1),
          //           border: Border(
          //             left: BorderSide(color: Color.fromARGB(111, 255, 111, 8)),
          //             bottom:
          //                 BorderSide(color: Color.fromARGB(80, 255, 111, 8)),
          //           )),
          //       gridData: FlGridData(
          //         show: true,
          //         getDrawingHorizontalLine: (value) {
          //           return FlLine(
          //               color: Color.fromARGB(161, 255, 255, 255),
          //               strokeWidth: .1);
          //         },
          //         drawVerticalLine: true,
          //         getDrawingVerticalLine: (value) {
          //           return FlLine(
          //               color: Color.fromARGB(118, 255, 255, 255),
          //               strokeWidth: .2);
          //         },
          //       ),
          //       titlesData: FlTitlesData(
          //         show: true,
          //         bottomTitles: SideTitles(
          //             showTitles: true,
          //             reservedSize: 35,
          //             getTextStyles: (context, value) {
          //               return const TextStyle(
          //                   color: Color(0xff68737d),
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold);
          //             },
          //             getTitles: (value) {
          //               switch (value.toInt()) {
          //                 case 0:
          //                   return 'Sep 19';
          //                 case 4:
          //                   return 'Oct 10';
          //                 case 8:
          //                   return 'Nov 16';
          //               }
          //               return '';
          //             },
          //             margin: 8),
          //         rightTitles: SideTitles(),
          //         topTitles: SideTitles(),
          //         leftTitles: SideTitles(
          //           showTitles: true,
          //           reservedSize: 35,
          //           getTextStyles: (context, value) {
          //             return const TextStyle(
          //                 color: Color(0xff68737d),
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.bold);
          //           },
          //           getTitles: (value) {
          //             switch (value.toInt()) {
          //               case 0:
          //                 return '0';
          //               case 2:
          //                 return '50';
          //               case 4:
          //                 return '100';
          //               case 6:
          //                 return '150';
          //             }
          //             return '';
          //           },
          //           margin: 12,
          //         ),
          //       ),
          //       maxX: 8,
          //       maxY: 8,
          //       minY: 0,
          //       minX: 0,
          //       lineBarsData: [
          //         LineChartBarData(
          //             spots: [
          //               const FlSpot(0, 0),
          //               const FlSpot(5, 7),
          //               const FlSpot(7, 6),
          //               const FlSpot(8, 4),
          //             ],
          //             isCurved: true,
          //             colors: [Colors.black12, Colors.white70, Colors.white],
          //             barWidth: 5,
          //             belowBarData: BarAreaData(
          //                 show: true,
          //                 colors: gradientColors
          //                     .map((e) => e.withOpacity(0.3))
          //                     .toList()))
          //       ])),
          // ),