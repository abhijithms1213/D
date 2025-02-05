
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadingHeading extends StatelessWidget {
  const LeadingHeading({
    super.key,
    required this.leading,
  });

  final String leading;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(leading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
      ],
    );
  }
}
