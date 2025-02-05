import 'package:flutter/material.dart';
import 'package:salhurry/presentation/create%20account/create_acc.dart';

class BottomRowWidget extends StatelessWidget {
  const BottomRowWidget({
    super.key,
    required this.width,
    required this.leading,
    required this.tail,
    required this.Screen,
  });

  final double width;
  final String leading;
  final String tail;
  final Widget Screen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(leading),
        SizedBox(
          width: width * .015,
        ),
        InkWell(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Screen,
            ),
          ),
          child: Text(
            tail,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
