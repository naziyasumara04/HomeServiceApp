import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  String setAdd = "surat";

  String setAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200.h,
            ),
            Text("This is demo screen"),
            Text(setAdd),
            Text(setAddress),
            GestureDetector(onTap: () async {
              try {
                List<Location> locations =
                    await locationFromAddress("Palanpur,Banaskantha");
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(24.1724, 72.4346);
                setState(() {
                  setAdd = "{$locations.first.longitude.toString()}" +
                      "   " +
                      "{$locations.first.latitude.toString()}";
                  setAddress = placemarks.last.locality.toString();
                });
              } catch (e) {
                print("Error,$e");
                setState(() {
                  setAddress = "failed to get address";
                  setAdd = "failes to get addd";
                });
              }

              child:
              Text(
                "Convert",
                style: TextStyle(
                  color: Colors.red,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}


