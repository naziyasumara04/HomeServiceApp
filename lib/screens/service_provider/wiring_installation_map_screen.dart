import 'package:flutter/material.dart';
import 'package:homeapp/screens/service_provider/wiring_installation_address_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';

class WiringInstallationMapScreen extends StatefulWidget {
  const WiringInstallationMapScreen({super.key});

  @override
  State<WiringInstallationMapScreen> createState() => _WiringInstallationMapScreenState();
}

class _WiringInstallationMapScreenState extends State<WiringInstallationMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wiring Installation"),
      ),
      body: buildBody(),
    );
  }
  
  Widget buildBody(){
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            Text("map screen"),
            CustomButton(btnText: "Fill Manually",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WiringInstallationAddressScreen()));
              // Navigator.pushNamed(context, AppRoutes.wiringInstallationAddress);
            },)
          ],
        ),
      ),
    );
  }
  
}
