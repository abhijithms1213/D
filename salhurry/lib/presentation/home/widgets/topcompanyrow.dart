
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetTopCompaniesRow extends StatelessWidget {
  const WidgetTopCompaniesRow({
    super.key, required this.leftportion,
  });
  final String leftportion;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         leftportion,
          style: GoogleFonts.inter(
            fontSize: 15,
            //    fontWeight: FontWeight.w800,
            // color: Colors.red,
          ),
        ),
        const Text(
          "view all",
          style: TextStyle(
            color: Colors.purple,
          ),
        )
      ],
    );
  }
}
