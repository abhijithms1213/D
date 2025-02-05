import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

bool visibling = true;
ValueNotifier<int> values = ValueNotifier(1);
const number = 0;

class Bottom2nav extends StatelessWidget {
  Bottom2nav({super.key});

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
                  backgroundColor: Colors.white,
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
                      icon: Image(
                        image: AssetImage("assets/images/pngmap.png"),
                        width: 28,
                        height: 28,
                      ),
                      label: "Location",
                    ),
                    BottomNavigationBarItem(
                        icon: Image(
                          image: AssetImage(
                            "assets/images/home-button-removebg-preview.png",
                          ),
                          width: 28,
                          height: 28,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Image(
                          image: AssetImage("assets/images/setting.png"),
                          width: 26,
                          height: 26,
                        ),
                        label: "Settings"),
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
