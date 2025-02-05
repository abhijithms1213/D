import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/home/widgets/conainerwidthfromtext.dart';

class WidgetTopCompaniesTile extends StatelessWidget {
  const WidgetTopCompaniesTile({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.mnc,
    required this.rating,
  });

  final double width;
  final double height;
  final String title;
  final String mnc;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .44,
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Container(
              width: width * .26,
              height: height * .05,
              color: Colors.blue,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 241, 147, 5),
                  size: 16,
                ),
                Text(
                  " $rating",
                  style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(.6)),
                ),
              ],
            ),
            ContainerWidthFromText(
              text: mnc,
              background: Colors.orange.withOpacity(.35),
              subjectColor: Colors.red,
            ),
            //  Row(mainAxisAlignment: MainAxisAlignment.center,
            //      children: [
            //   //    SizedBox(),
            //        Container(
            //           decoration: BoxDecoration(color: Colors.green),
            //           child: Center(child: Text("aaaa"),),),
            //          // SizedBox(),
            //      ],
            //    ),
            Text(
              "View jobs",
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 66, 32, 178),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
