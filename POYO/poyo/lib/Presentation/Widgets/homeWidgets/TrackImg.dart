import 'package:flutter/material.dart';
import 'package:poyo/cores/constants/const.dart';
import '../../LiveTracking/livetrack.dart';
import 'favourites.dart';

class WidgetTrackingImages extends StatelessWidget {
  const WidgetTrackingImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ScreenLiveTracking();
                    },
                  ),
                );
              },
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(.4),
                    ),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Pixel_Working_11 (1).jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            kwbox30,
            //fav stack
            Column(
              children: const [
                ScreenFav(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
