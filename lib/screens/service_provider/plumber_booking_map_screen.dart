import 'package:flutter/material.dart';
import 'package:homeapp/screens/service_provider/plumber_booking_address_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';

class PlumberBookingMapScreen extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const PlumberBookingMapScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  State<PlumberBookingMapScreen> createState() =>
      _PlumberBookingMapScreenState();
}

class _PlumberBookingMapScreenState extends State<PlumberBookingMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plumber Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            children: [
              Text("Plumber booking map screen"),
              CustomButton(
                btnText: "Fill Manually",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlumberBookingAddressScreen(
                                image: widget.image,
                                title: widget.title,
                                subTitle: widget.subTitle,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
