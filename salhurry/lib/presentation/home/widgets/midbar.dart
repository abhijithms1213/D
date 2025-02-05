import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class WidgetMidBar extends StatelessWidget {
  const WidgetMidBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "New jobs",
              style: GoogleFonts.inter(
                //    fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              color: Colors.purple,
              height: 3,
              width: 60,
            )
          ],
        ),
        const Text(
          "featured",
          style: TextStyle(color: Colors.black38),
        ),
        const Text(
          "recommended",
          style: TextStyle(color: Colors.black38),
        ),
      ],
    );
  }
}
