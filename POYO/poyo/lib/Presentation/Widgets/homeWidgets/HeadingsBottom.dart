import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetHeading extends StatelessWidget {
  const WidgetHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Live Tracking",
          style: GoogleFonts.orbitron(
              fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 60,
        ),
        Text(
          "Favourites",
          style: GoogleFonts.orbitron(
              fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
