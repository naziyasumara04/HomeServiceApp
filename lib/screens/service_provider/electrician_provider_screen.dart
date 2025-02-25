import 'package:flutter/material.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/service_provider/search_filter_screen.dart';
import 'package:homeapp/widgets/custom_gridview.dart';

class ElectricianProviderScreen extends StatefulWidget {
  const ElectricianProviderScreen({super.key});

  @override
  State<ElectricianProviderScreen> createState() =>
      _ElectricianProviderScreenState();
}

class _ElectricianProviderScreenState extends State<ElectricianProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electrician Providers"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchFilterScreen()));
                },
                icon: Icon(Icons.tune)),
          )
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomGridview(items: [
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Jackson',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Logan',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Ethan Lita',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Jackson',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Isabulla Una',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Jackson',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Panama',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Jamalo',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Jackson',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': 'Emiway',
              'subtitle': 'Electrician',
              'rating': '3.5'
            },
          ]),
        ],
      ),
    );
  }
}
