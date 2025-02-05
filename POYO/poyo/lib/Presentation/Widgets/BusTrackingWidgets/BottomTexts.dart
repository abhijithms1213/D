import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/const.dart';

class WidgetBottomTexts extends StatelessWidget {
  const WidgetBottomTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Current Location",style: TextStyle(color: Colors.black.withOpacity(.4))),
          khbox2,
          const Text(
            "Uriyakkod,Near Sarabhai",
            style: TextStyle(color: Color.fromARGB(255, 169, 0, 0)),
          ),
          khbox20,
           Text("Expected Time",style: TextStyle(color: Colors.black.withOpacity(.4)),),
          khbox2,
          const Text(
            "4.30 pm",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: size.width * .66,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                  "Arrival Time",
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
                khbox2,
                const Text(
                  "Expected Within 20 min.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Type",
            style: TextStyle(color: Colors.black.withOpacity(.4)),
          ),
          khbox2,
          const Text(
            "Ordinary",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          khbox20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Depot"),
              kwbox015,
              Container(
                width: .1,
                height: size.height * .035,
                color: colorblack,
              ),
              kwbox015,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("TIME TO REACH",style: GoogleFonts.yantramanav(),),
                  khbox4,
                  Text("TIME FROM",style: GoogleFonts.yantramanav()),
                ],
              ),
              kwbox015,
              Container(
                width: .1,
                height: size.height * .035,
                color: colorblack,
              ),
              kwbox015,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "10.30pm",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  khbox4,
                  Text(
                    "06.30am",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
