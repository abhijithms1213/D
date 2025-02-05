
import 'package:flutter/material.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/const.dart';

class WidgetFavBottomRow extends StatelessWidget {
  const WidgetFavBottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
                   color: colorRowFav,
        ),
       kwbox015,
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home), 
          color: colorRowFav,
        ),
      kwbox015,
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: colorRowFav,
        ),
      ],
    );
  }
}
