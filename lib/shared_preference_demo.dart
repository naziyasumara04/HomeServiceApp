// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPreferenceDemo extends StatefulWidget {
//   const SharedPreferenceDemo({super.key});
//
//   @override
//   State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
// }
//
// class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
//   final TextEditingController nameController = TextEditingController();
//   String name = "your name here";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isLogin();
//   }
//
//   void isLogin() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     Set<String> keys = prefs.getKeys();
//
//     for (String key in keys) {
//       var valuees = prefs.get(key);
//       print('keysss:$key values:$valuees');
//     }
//     String savedName = await prefs.getString('textName') ?? "";
//     if (savedName != null) {
//       name = savedName;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Shared preference demo"),
//             Text(name),
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   labelText: 'Enter Name',
//                   hintText: 'Enter Your Name'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () async {
//             final SharedPreferences prefs =
//                 await SharedPreferences.getInstance();
//             // await prefs.setString('textName', nameController.text);
//             // await prefs.setInt('val', 100);
//             // await prefs.setString('name', 'naziya');
//             // await prefs.setBool('isclicked', false);
//
//             prefs.remove('val');
//             prefs.remove('name');
//             prefs.remove('isclicked');
//             prefs.remove('textName');
//             // await
//
//             // final String? strValue =
//             await prefs.getString('name');
//             await prefs.getBool('isclicked');
//             await prefs.getInt('val');
//             final String textValue = await prefs.getString('textName') ?? " ";
//
//             setState(() {
//               // name = "hello after btn clicked";
//               name = textValue;
//               print(textValue);
//               print("btn clickded");
//             });
//           }),
//     );
//   }
// }


import 'package:flutter/material.dart';


class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("shared preferences demooo"),
    );
  }
}
