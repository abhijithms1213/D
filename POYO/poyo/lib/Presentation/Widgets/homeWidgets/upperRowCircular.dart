import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WidgetHomeUpperRow extends StatelessWidget {
  const WidgetHomeUpperRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          
        ),
        const Padding(
          padding: EdgeInsets.only(right: 25.0, top: 20),
          child: CircleAvatar(
            radius: 27,
            backgroundImage: AssetImage(
              "assets/images/ico-removebg-preview.jpg",
            ),
          ),
        )
      ],
    );
  }
}
