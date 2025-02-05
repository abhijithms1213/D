import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/Job%20details/widgets/apply2.dart';
import 'package:salhurry/presentation/Job%20details/widgets/jobdetails.dart';
import 'package:salhurry/presentation/Job%20details/widgets/top.dart';
import 'package:salhurry/presentation/Job%20details/widgets/toprowhighlight.dart';
import 'package:salhurry/presentation/constants/const.dart';

class ScreenJobDetails extends StatelessWidget {
  const ScreenJobDetails({
    super.key,
    required this.documentSnapshots,
    required this.loc,
    required this.title,
  });
  final String documentSnapshots;
  final String loc;
  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetTop(height: height),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      khbox30,
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      khbox10,
                      Text(
                        loc,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          //     fontWeight: FontWeight.w700,
                        ),
                      ),
                      khbox20,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: WidgetHighlightRow(
                        width: width,
                        height: height,
                        documentSnapshot: documentSnapshots),
                  ),
                  khbox20,
                  WidgetJobDetails(
                    documentSnapshots: documentSnapshots,
                  ),
                  const Spacer(),
                  WidgetApplyButton(width: width, height: height,
                   documentSnapshots:documentSnapshots
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
