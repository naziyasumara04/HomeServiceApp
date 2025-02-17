import 'package:flutter/material.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_listview.dart';
import 'package:homeapp/widgets/rating_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {
        'imagepath': AppImages.logout,
        'text': 'Product 1',
      },
      {
        'imagepath': AppImages.logout,
        'text': 'Product 1',
      },
      {
        'imagepath': AppImages.appLogo,
        'text': 'Product 3',
      },
      {
        'imagepath': AppImages.appLogo,
        'text': 'Product 3',
      },
      {
        'imagepath': AppImages.appLogo,
        'text': 'Product 3',
      },
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Image.asset(
            AppImages.appLogo,
            width: 40,
            height: 33,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Icon(Icons.call),
          ),
          // Image.asset(AppImages.appLogo)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //add linear gradient box here and also add search box here..
            GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const RatingWidget(),
                  ),
                );
              },
              child: Text("view all"),
            ),

            CustomListview(
              items: products,
            ),

          ],
        ),
      ),
    );
  }
}
