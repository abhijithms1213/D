import 'package:flutter/material.dart';

ValueNotifier<int> val = ValueNotifier(0);

class ScreenBottom extends StatelessWidget {
  const ScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: val,
      builder: (context, value, child) {
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.black12,
              selectedItemColor: Colors.black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: value,
              onTap: (index) {
                val.value = index;
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.woman), label: "Teachers"),
                BottomNavigationBarItem(icon: Icon(Icons.man), label: "students"),
              ],
            ),
          ),
        );
      },
    );
  }
}
