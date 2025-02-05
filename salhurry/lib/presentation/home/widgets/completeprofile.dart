import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salhurry/presentation/constants/const.dart';

class WidgetCompleteProfile extends StatelessWidget {
  const WidgetCompleteProfile({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: const Color.fromARGB(16, 0, 0, 0), width: 2),
          ),
          width: width * .45,
          height: height * .11,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      height: height * .07,
                      width: width * .2,
                      decoration: const BoxDecoration(
                        //   color: Colors.black54,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/prfile.png",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    khbox2,
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "   80%   ",
                          style: TextStyle(fontSize: 10),
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sreeraj's profile",
                      style: TextStyle(fontSize: 10),
                    ),
                    Spacer(),
                    Text(
                      "6 missing details",
                      style: TextStyle(fontSize: 10),
                    ),
                    // SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * .015),
        Container(
          width: width * .4,
          height: height * .04,
          decoration: BoxDecoration(
            // color: Colors.grey[100],
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
            "Complete profile now",
            style: TextStyle(color: Colors.white.withOpacity(.8), fontSize: 13),
          )),
        ),
      ],
    );
  }
}
