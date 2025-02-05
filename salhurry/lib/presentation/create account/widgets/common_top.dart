import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTopWidget extends StatelessWidget {
  const LoginTopWidget({
    super.key,
    required this.height,
    required this.width, required this.getText,
  });

  final double height;
  final double width;
  final String getText;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * .28,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * .1,
                height: width * .1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/Vector 10.png",
                    ),
                    // fit: BoxFit.contain
                  ),
                ),
              ),
              SizedBox(
                width: width * .01,
              ),
              Text(
                "Salhurry",
                style: GoogleFonts.getFont(
                  'Noto Sans',
                  fontSize: width * .07,
                  color: const Color.fromARGB(255, 66, 32, 178),
                ),
              ),
            ],
          ),
        ),
        Text(
          getText,
          style: GoogleFonts.nunito(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
