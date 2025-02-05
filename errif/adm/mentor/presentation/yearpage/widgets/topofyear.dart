import 'package:flutter/material.dart';

class WidgetTopOfYearPage extends StatelessWidget {
  const WidgetTopOfYearPage({
    super.key,
    required this.widthofscreen,
    required this.heightofscreen,
  });

  final double widthofscreen;
  final double heightofscreen;
//year page its like home
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthofscreen,
      height: heightofscreen * .35,
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(
                height: heightofscreen * .09,
              ),
              Row(
                children: const [
                  Text(
                    "Select The Year/Sem",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: heightofscreen * .02,
              ),
              const Text(
                "This page will leads you to select the semester/year that you need to enter the attendence",
                style: TextStyle(
                  color: Colors.white30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
