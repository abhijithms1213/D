import 'package:flutter/material.dart';

bool visibling = true;
ValueNotifier<int> values = ValueNotifier(0);

class Bottom2nav extends StatelessWidget {
  const Bottom2nav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: values,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 208, 208, 208).withOpacity(.6)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Visibility(
                visible: visibling,
                child: BottomNavigationBar(
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  unselectedItemColor: Colors.black26,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  //nselectedItemColor: Color.fromARGB(255, 255, 252, 252),
                  elevation: 0,
                  onTap: (value) {
                    values.value = value;
                    // if (value == 2) {
                    //   visibling = false;
                    // }
                  },
                  //    assets/images/setting.png
                  currentIndex: value,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: "Search"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications), label: "Notification"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.money), label: "Earnings"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_2), label: "Profile"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
