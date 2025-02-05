import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/constants/const.dart';

class ScreenEarnings extends StatelessWidget {
  const ScreenEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * .1,
              width: double.infinity,
              color: const Color.fromARGB(6, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "       My Wallet",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      //fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: height * .25,
              width: double.infinity,
              color: const Color.fromARGB(16, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(147, 255, 255, 255),
                  ),
                  height: height * .1,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹",
                            style: GoogleFonts.inter(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            " 2350",
                            style: GoogleFonts.inter(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "My Earnings",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            khbox10,
            Container(
              width: width * .9,
              height: height * .15,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(42, 187, 187, 187),
                      blurRadius: 200,
                      spreadRadius: 21,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kwbox10,
                  Text(
                    "Total Work Done",
                    style: GoogleFonts.archivo(
                        color: const Color.fromARGB(153, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  const Spacer(),
                  Container(
                    width: 70,
                    //  margin: EdgeInsets.all(100.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: const Color.fromARGB(255, 25, 116, 190),
                      ),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                            color: Color.fromARGB(255, 25, 116, 190),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  kwbox10,
                  kwbox5,
                ],
              ),
            ),
            // total applied
            Container(
              width: width * .9,
              height: height * .15,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(42, 187, 187, 187),
                      blurRadius: 200,
                      spreadRadius: 21,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kwbox10,
                  Text(
                    "Total Jobs Applied",
                    style: GoogleFonts.archivo(
                        color: const Color.fromARGB(153, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  const Spacer(),
                  Container(
                    width: 70,
                    //  margin: EdgeInsets.all(100.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Color.fromARGB(255, 32, 204, 9),
                      ),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                            color: Color.fromARGB(255, 32, 204, 9),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  kwbox10,
                  kwbox5,
                ],
              ),
            ),

            //tr hstry
            khbox10,
            Container(
              width: width * .9,
              height: height * .15,
              decoration: BoxDecoration(
                  color: Color.fromARGB(127, 252, 252, 252),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(42, 187, 187, 187),
                      blurRadius: 200,
                      spreadRadius: 21,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kwbox10,
                  Text(
                    "Transaction History",
                    style: GoogleFonts.archivo(
                        color: const Color.fromARGB(153, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  kwbox10,
                  kwbox5,
                  Icon(
                    Icons.arrow_circle_right,
                    size: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
