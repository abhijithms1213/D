import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/datewise/widgets/bottumofdate.dart';

class WidgetListTopFromDate extends StatefulWidget {
  const WidgetListTopFromDate({
    Key? key,
    required this.widthofscreen,
    required this.heightofscreen,
    required this.dept,
    required this.yrs,
    required this.userId,
  }) : super(key: key);

  final double widthofscreen;
  final double heightofscreen;
  final String dept;
  final String yrs;
  final String userId;

  @override
  _WidgetListTopFromDateState createState() => _WidgetListTopFromDateState();
}

class _WidgetListTopFromDateState extends State<WidgetListTopFromDate> {
  int selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    print(2);
    final CollectionReference dptYears = FirebaseFirestore.instance
        .collection('professor')
        .doc(widget.userId)
        .collection('department')
        .doc(widget.dept)
        .collection(widget.dept)
        .doc(widget.yrs)
        .collection('date');
    return StreamBuilder<QuerySnapshot>(
      stream: dptYears.orderBy('month').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No collections found.');
        }

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final DocumentSnapshot dptYearssnap = snapshot.data.docs[index];
            final isSelected =
                selectedIndex == index; // Check if the item is selected
            return SizedBox(
              //   color:  isSelected ? Colors.white : Colors.black,
              width: widget.widthofscreen * 0.15,
              height: widget.heightofscreen * 0.01,
              child: InkWell(
                onTap: () {
                  setState(() {
                    //    print(2);
                    selectedIndex = index;
                    print(100);
                  });

                  // WidgetDownOfDate(
                  //     day: "day",
                  //     heightofscreen: widget.heightofscreen,
                  //     widthofscreen: widget.widthofscreen,
                  //     yrs: widget.yrs,
                  //     dept: widget.dept,
                  //     userId: widget.userId

                  //     ).needData( dptYearssnap['fully'] as String);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dptYearssnap['monthName'],
                      style: TextStyle(
                        fontSize: 12.0,
                        color: isSelected ? Colors.white : Colors.white38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${dptYearssnap['day']}',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: isSelected
                            ? Colors.white
                            : Color.fromARGB(159, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              width: widget.widthofscreen * 0.05,
            );
          },
          itemCount: snapshot.data!.docs.length,
        );
      },
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class WidgetListTopFromDate extends StatelessWidget {
//   const WidgetListTopFromDate({
//     Key? key,
//     required this.widthofscreen,
//     required this.heightofscreen,
//     required this.dept,
//     required this.yrs,
//     required this.userId,
//   }) : super(key: key);

//   final double widthofscreen;
//   final double heightofscreen;
//   final String dept;
//   final String yrs;
//   final String userId;

//   @override
//   Widget build(BuildContext context) {
//     final CollectionReference dptYears = FirebaseFirestore.instance
//         .collection('professor')
//         .doc(userId)
//         .collection('department')
//         .doc(dept)
//         .collection(dept)
//         .doc(yrs)
//         .collection('date');
//     return StreamBuilder<QuerySnapshot>(
//       stream: dptYears.orderBy('month').snapshots(),
//       builder: (context,AsyncSnapshot snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Container();
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Text('No collections found.');
//         }

//         return ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             final DocumentSnapshot dptYearssnap=snapshot.data.docs[index];
//             return SizedBox(
//               width: widthofscreen * 0.15,
//               height: heightofscreen * 0.01,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                    Text(
//                    dptYearssnap['monthName'],
//                     style: const TextStyle(
//                       fontSize: 12.0,
//                       color: Colors.white38,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//              '${dptYearssnap['day']}',
//                     style: const TextStyle(
//                       fontSize: 35.0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return Container(
//               width: widthofscreen * 0.05,
//             );
//           },
//           itemCount: snapshot.data!.docs.length,
//         );
//       },
//     );
//   }
// }
