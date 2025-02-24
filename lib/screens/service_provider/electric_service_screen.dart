import 'package:flutter/material.dart';

class ElectricServiceScreen extends StatefulWidget {
  final Widget electricWidget;

  const ElectricServiceScreen({super.key, required this.electricWidget});

  @override
  State<ElectricServiceScreen> createState() => _ElectricServiceScreenState();
}

class _ElectricServiceScreenState extends State<ElectricServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electric Service"),
      ),
      body: buildBody()
    );
  }

  Widget buildBody(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        children: [
          electricServiceCard()
        ],
      ),
    );
  }

  Widget electricServiceCard(){
    return Container(
      child: widget.electricWidget,
    );
  }

}
