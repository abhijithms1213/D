
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetTop extends StatelessWidget {
  const WidgetTop({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 66, 32, 178),
      height: height * 0.12,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Job Details",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
