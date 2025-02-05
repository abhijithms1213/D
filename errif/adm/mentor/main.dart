import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mentor_app/auth/login.dart';
import 'package:mentor_app/presentation/attendencesee/atndnceseefromperiodpage.dart';
import 'package:mentor_app/presentation/home/home.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'model/controlled.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
       //  Get.put(QController());
        if (snapshot.hasData) {
          return ScreenHome();
        } else {
          return LoginForm();
        }
      },
    ));
  }
}

// import 'package:flutter/material.dart';

// class ListItem {
//   String title;
//   bool isChecked;

//   ListItem({required this.title, this.isChecked = false});
// }

// class MyListView extends StatefulWidget {
//   @override
//   _MyListViewState createState() => _MyListViewState();
// }

// class _MyListViewState extends State<MyListView> {
//   List<ListItem> items = [
//     ListItem(title: 'Item 1'),
//     ListItem(title: 'Item 2'),
//     ListItem(title: 'Item 3'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ListView with Checkboxes'),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(items[index].title),
//             leading: Checkbox(
//               value: items[index].isChecked,
//               onChanged: (value) {
//                 setState(() {
//                   items[index].isChecked = value ?? false;
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: MyListView(),
//   ));
// }
