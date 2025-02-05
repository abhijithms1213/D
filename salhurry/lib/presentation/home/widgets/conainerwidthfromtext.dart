import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerWidthFromText extends StatefulWidget {
  final String text;
  final Color background;
  final Color subjectColor;

  const ContainerWidthFromText(
      {super.key,
      required this.text,
      required this.background,
      required this.subjectColor});

  @override
  ContainerWidthFromTextState createState() => ContainerWidthFromTextState();
}

class ContainerWidthFromTextState extends State<ContainerWidthFromText> {
  late double _containerWidth;

  @override
  void initState() {
    super.initState();
    _calculateWidth();
  }

  void _calculateWidth() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: widget.text, style: const TextStyle(color: Colors.white)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    setState(() {
      _containerWidth = textPainter.size.width + 20.0; // Adding some padding
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: widget.background),
      width: _containerWidth,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.inter(color: widget.subjectColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
