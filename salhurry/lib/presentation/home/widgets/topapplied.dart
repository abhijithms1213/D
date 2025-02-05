import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/constants/const.dart';

class WidgetAppliedListTop extends StatelessWidget {
  const WidgetAppliedListTop({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.rating,
    required this.posted,
    required this.loc,
    required this.slots,
  });

  final double width;
  final double height;
  final String title;
  final String rating;
  final String posted;
  final String loc;
  final String slots;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .2,
      height: height * .24,
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
            khbox5,
            Row(
              children: [
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.red,
                ),
                kwbox5,
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 241, 147, 5),
                  size: 13,
                ),
                Text(" $rating",style: TextStyle(fontSize: 11),),
              ],
            ),
            khbox5,
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loc,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //     Text(
                  //       "Actively hiring peoples",
                  // style: GoogleFonts.inter(
                  //   fontSize: 15,
                  //   fontWeight: FontWeight.w600,
                  //   color: Color.fromARGB(255, 37, 138, 8)
                  // ),
                  //     ),
                  khbox8,
                  Text(
                    "$slots slots left",
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: const Color.fromARGB(255, 209, 28, 15),
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                  khbox10,
                   Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(color: Color.fromARGB(255, 11, 75, 140),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("applied",style: TextStyle(color: Color.fromARGB(221, 255, 255, 255),fontSize: 10),),),
            ),
                ],
              ),
            ),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "posted $posted ago",
                  style: const TextStyle(
                      color: Color.fromARGB(95, 0, 0, 0), fontSize: 10),
                ),
                khbox15,
              ],
            )
          ],
        ),
      ),
    );
  }
}
