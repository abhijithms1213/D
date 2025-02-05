import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/Job%20details/details.dart';
import 'package:salhurry/presentation/constants/const.dart';
import 'package:salhurry/presentation/home/widgets/conainerwidthfromtext.dart';

class WidgetBottomJobsTile extends StatelessWidget {
  const WidgetBottomJobsTile({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.rating,
    required this.t1,
    required this.posted,
    required this.loc,
    required this.t2,
    required this.t3,
    required this.slots,
    required this.documentSnapshots,
  });

  final double width;
  final double height;
  final String title;
  final String rating;
  final String t1;
  final String posted;
  final String loc;
  final String slots;

  final String t2;
  final String t3;
  final String documentSnapshots; // DocumentSnapshot for this tile

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: width * .4,
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
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            khbox5,
            Row(
              children: [
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.red,
                ),
                kwbox5,
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 241, 147, 5),
                  size: 16,
                ),
                Text(" $rating"),
              ],
            ),
            khbox5,
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    loc,
                    style: GoogleFonts.inter(
                      fontSize: 15,
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
                      fontSize: 13,
                      color: const Color.fromARGB(255, 209, 28, 15),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 20,
              width: double.infinity,
              child: Row(
                children: [
                  ContainerWidthFromText(
                    text: t1,
                    subjectColor: Colors.black,
                    background: const Color.fromARGB(25, 0, 0, 0),
                  ),
                  kwbox10,
                  ContainerWidthFromText(
                    text: t2,
                    subjectColor: Colors.black,
                    background: const Color.fromARGB(25, 0, 0, 0),
                  ),
                  kwbox10,
                  ContainerWidthFromText(
                    text: t3,
                    subjectColor: Colors.black,
                    background: const Color.fromARGB(25, 0, 0, 0),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "posted $posted ago",
                  style: const TextStyle(color: Color.fromARGB(95, 0, 0, 0)),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  ScreenJobDetails(documentSnapshots: documentSnapshots,loc: loc,title: title,),),);
                      },
                      child: Container(
                        width: width * .18,
                        height: height * .036,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 66, 32, 178),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                   // khbox15,
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
