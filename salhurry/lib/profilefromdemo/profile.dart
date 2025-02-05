import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/presentation/constants/const.dart';

class ScreenProfilee extends StatelessWidget {
  const ScreenProfilee({super.key});
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                auth.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              }),
        ],
        title: const Text(
          'profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 5, 80),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: height * .16 - height * .07,
                  ),
                  child: Container(
                    color: Colors.grey,
                    height: height * .16,
                    width: double.infinity,
                    child: Image.network(
                      "https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: height * .16 - height * .07,
                  child: CircleAvatar(
                    radius: height * .075,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: height * .07,
                      backgroundImage: const NetworkImage(
                          "https://i.pinimg.com/564x/44/67/c7/4467c7b20cb2e574e76266a6f40c8201.jpg"),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                "Kasi",
                style: GoogleFonts.sanchez(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            khbox10,
            Container(
              width: 40,
              height: 30,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/star_rating.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  khbox5,
                  const Text(
                      "Versatile professional seeking part-time opportunities. Proficient in various domains, with a keen eye for detail and efficiency. "),
                  khbox10,
                  Text(
                    "Top Skills",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  khbox15,
                  const Row(
                    //     spacing: 10.0,
                    // runSpacing: 10.0,
                    children: [
                      WidgetSkillContainer(text: "Language"),
                      WidgetSkillContainer(text: "communication"),
                      WidgetSkillContainer(text: "writing"),
                    ],
                  ),
                  khbox15,
                  Text(
                    "Education",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  khbox5,
                  const Text("B.tech"),
                  khbox10,
                   Text(
                    "Availability",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  khbox5,
                  const Text("* monday to friday Available around: 06.00- 10.00 am"),
                   const Text("* sat,sun Available around: 02.00- 05.00 pm"),
                    khbox10,
                   Text(
                    "Location Preference",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  khbox5,
                  const Text("Trivandrum City Area (btwn tvm central-Nedumangadu)"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget buildCoverArea(){
  //   return
  // }
}

class WidgetSkillContainer extends StatelessWidget {
  const WidgetSkillContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
        kwbox10,
      ],
    );
  }
}
