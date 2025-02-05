import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/constants/const.dart';
class WidgetTopOFHome extends StatelessWidget {
  const WidgetTopOFHome({
    super.key,
    required this.height,
    required this.width,
    required this.hinttext,
  });

  final double height;
  final double width;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .13,
      decoration: BoxDecoration(
        //color: const Color.fromARGB(255, 66, 32, 178),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  Container(
                    width: width * .6,
                    height: 30,
                    decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        color: const Color.fromARGB(255, 246, 246, 246),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _password,
                        decoration: InputDecoration(
                          hintText: hinttext,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.message)
                ],
              ),
            ),
            Row(
              children: [
                 Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Vector 10.png"))),
                ),
              kwbox5,
                Text(
                  "Salhurry",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 66, 32, 178),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
