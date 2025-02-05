import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenMap extends StatelessWidget {
  const ScreenMap({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size=m
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
              Text("Bus "),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            ],
          ),
        ],
      )),
    );
  }
}
