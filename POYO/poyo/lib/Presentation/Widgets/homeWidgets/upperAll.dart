import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/upperRowCircular.dart';

import '../../../cores/constants/const.dart';

class WidgetHomeTopAll extends StatelessWidget {
  const WidgetHomeTopAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //UpperRow
            const WidgetHomeUpperRow(),
            Text(
              "Hi Thanos,",
              style: GoogleFonts.podkova(
                  fontWeight: FontWeight.bold, fontSize: 28),
            ),
            kspace5,
            Text(
              "Welcome To Our New World",
              style: GoogleFonts.nunito(fontSize: 20),
            ),
            khbox8,
            //image
            Container(
              height: size.height * .235,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/photo_2023-04-03_18-20-44.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
