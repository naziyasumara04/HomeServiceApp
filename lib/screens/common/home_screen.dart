import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/service_provider/all_service_provider_screen.dart';
import 'package:homeapp/screens/service_provider/search_filter_screen.dart';
import 'package:homeapp/screens/service_seeker/call_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:homeapp/widgets/custom_listview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/custom_gridview.dart';
import '../service_provider/electric_service_screen.dart';
import '../service_provider/popular_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _allServices = [
    {'name': 'Carpenter'},
    {'name': 'Cloth Washer'},
    {'name': 'Plumber'},
    {'name': 'Electrician'},
    {'name': 'House Cleaning'},
    {'name': 'Painter'},
  ];

  bool _showList = false;

  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();

  Widget showSearchList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Position of the shadow
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true, // Prevents unnecessary scrolling issues
        itemCount: _allServices.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color for each item
              border: Border(
                bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1), // Divider between items
              ),
            ),
            child: ListTile(
              title: Text(
                _allServices[index]['name'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500), // Styling the text
              ),
              onTap: () {
                setState(() {
                  _controller.text = _allServices[index]['name'];
                  _showList = false; // Hide list when an item is selected
                });
                if (_controller.text == 'Electrician') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            // appBar: AppBar(title: Text(_controller.text)),
                            body:
                                electricianBody() // Display ListView on a new screen
                            )),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  final String fromNumber = '+919510234855';
  final String toNumber = '+918469516632';

  Future<void> _makeCall(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $number';
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallScreen(
                      fromNumber: '+918888888888',
                      toNumber: '+918469516632',
                    ),
                  ),
                );
              },
              child: Icon(Icons.call),
            ),
          ),
        ],

      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              search(),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  popularServices(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Positioned(
                      child: _showList
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  showSearchList(),
                                ],
                              ),
                            )
                          : Container())
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              serviceProviders()
            ],
          ),
        ),
      ),
    );
  }

  Widget popularServices() {
    return Column(
      children: [
        //add linear gradient box here and also add search box here..
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Services",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const PopularServices(),
                  ),
                );
              },
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),

        CustomListview(
          items: [
            {
              'imagepath': AppImages.plumber,
              'text': 'Plumbing',
            },
            {
              'imagepath': AppImages.multiMeter,
              'text': 'Electric work',
            },
            {
              'imagepath': AppImages.solarEnergy,
              'text': 'Solar',
            },
            {
              'imagepath': AppImages.plumber,
              'text': 'Plumbing',
            },
          ],
        ),
      ],
    );
  }

  Widget search() {
    return SizedBox(
      // height:MediaQuery.of(context).size.height ,
      width: 327.w,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          height: 180.h,
          width: 327.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                  colors: [AppColors.lightBlueColor, AppColors.darkBlueColor])),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Get 30% off",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Just by Booking Home \nServices ",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 5,
            top: 0,
            child: SizedBox(
              height: 167.h,
              width: 134.w,
              child: Image.asset(
                AppImages.girlImg,
                width: 134.w,
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              height: 56.h,
              width: 327.w,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(6)),
              child: TextField(
                controller: _controller,
                onTap: () {
                  setState(() {
                    // _controller.text = _allServices[index]['name'];
                    _showList = true; // Show the list when TextField is tapped
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchFilterScreen()));
                      },
                      icon: Icon(Icons.tune)),
                  hintText: "search here",
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            )),
      ]),
    );
  }

  Widget serviceProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Service Providers",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllServiceProviderScreen()));
              },
              child: Text(
                "View all",
                style: TextStyle(
                    color: AppColors.lightBlueColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomGridview(
          items: [
            {
              'imagepath': AppImages.plumberImg,
              'title': "Maskot Kota",
              'subtitle': "Plumber",
              'rating': "4.8"
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': "Shams Jan",
              'subtitle': "Electrician",
              'rating': "4.8"
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': "Kota Maskot",
              'subtitle': "Electrician",
              'rating': "4.8"
            },
            {
              'imagepath': AppImages.electricianImg,
              'title': "Shams Jan",
              'subtitle': "Electrician",
              'rating': "4.8"
            },
          ],
        ),
      ],
    );
  }

  Widget electricianBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 56.h,
              width: 327.w,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(6)),
              child: TextField(
                controller: _controller,
                onTap: () {
                  setState(() {
                    // _controller.text = _allServices[index]['name'];
                    _showList = true; // Show the list when TextField is tapped
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchFilterScreen()));
                      },
                      icon: Icon(Icons.tune)),
                  hintText: _controller.text,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            electricCard(context: context, showButton: true),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Electrician Providers",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    "View all",
                    style: TextStyle(color: AppColors.lightBlueColor),
                  )
                ],
              ),
            ),
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
      ),
    );
  }

  Widget electricCard(
      {required bool showButton, required BuildContext context}) {
    return Container(
      height: showButton ? 276.h : 210.h,
      width: 327.w,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Electric Services",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Image.asset(AppImages.electricityMeter),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.lightBlueColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "4.8",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "(76)",
                    style: TextStyle(
                      color: Color.fromRGBO(145, 145, 145, 1),
                    ),
                  )
                ],
              ),
              Text(
                "\$20/hour",
                style: TextStyle(
                    color: AppColors.lightBlueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.alarmClock),
              Row(
                children: [
                  Container(
                    height: 24.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(212, 224, 235, 1),
                          blurRadius: 4,
                          // spreadRadius: 1,
                          offset: Offset(1, 1), // Adjust shadow position
                        ),
                      ],
                    ),
                    child: InkWell(
                      child: Center(
                        child: Text(
                          "7:00 AM",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "To",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(145, 145, 145, 1),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 24.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(212, 224, 235, 1),
                          blurRadius: 4,
                          // spreadRadius: 1,
                          offset: Offset(1, 1), // Adjust shadow position
                        ),
                      ],
                    ),
                    child: InkWell(
                      child: Center(
                        child: Text(
                          "10:00 AM",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          showButton
              ? CustomButton(
                  btnText: "Get this Services",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ElectricServiceScreen(
                                  electricWidget: electricCard(
                                      showButton: false, context: context),
                                )));
                  },
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
