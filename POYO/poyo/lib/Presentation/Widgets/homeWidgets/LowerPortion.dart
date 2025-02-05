import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/HeadingsBottom.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/TrackImg.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/text.dart';
import 'package:poyo/cores/constants/const.dart';

class WidgetLowerAll extends StatelessWidget {
  const WidgetLowerAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height *.71,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Main Features",
              style: GoogleFonts.russoOne(fontSize: 20),
            ),
            khbox20,
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              //Headings
              child: WidgetHeading(),
            ),
            khbox20,
            //Livetrack Fav Images
            const WidgetTrackingImages(),
            khbox30,
            ScreenListWidget(
              textDescription:
                  "Bus depot stores, maintains, and manages buses, serving as the starting and ending point for routes. It offers services like ticketing, waiting rooms, and restrooms. Multiple depots are used by bus companies to manage operations.",
              listTex: "Depot list",
              imgText: "assets/images/warehouse.jpg",
              listvalue: 0,
            ),
            khbox20,
            ScreenListWidget(
              textDescription:
                  "Bus timings are the schedules for bus arrivals and departures at the starting and ending points. Passengers use the timings to plan their travel and catch the bus on time.",
              listTex: "Bus Timing",
              imgText: "assets/images/58090.jpg",
              listvalue: 1,
            ),
            khbox20,
            ScreenListWidget(
              textDescription:
                  "A help line is a communication service that provides assistance and support to people in need. It typically offers a toll-free number or online chat for individuals to connect with trained professionals who can provide information or guidance",
              imgText:
                  "assets/images/233ff881304925.Y3JvcCw5OTIsNzc2LDI3Nyww.jpg",
              listTex: "Help-Line",
              listvalue: 2,
            ),
            khbox20,
          ],
        ),
      ),
    );
  }
}
