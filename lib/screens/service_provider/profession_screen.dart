import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../core/constants/app_colors.dart';

class ProfessionScreen extends StatefulWidget {
  const ProfessionScreen({super.key});

  @override
  State<ProfessionScreen> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.lightBlueColor),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(
          "Profession",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.lightBlueColor),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [professionCont()],
      ),
    );
  }

  Widget professionCont() {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Service name",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        CardField(
          width: 327,
          hintText: 'cleaner',
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Expert in",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        CardField(
          width: 327,
          hintText: 'Home clean, lawn clean, Washing',
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Service Timing",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From",
                  style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CardField(
                  width: 154,
                  hintText: '9:00AM',
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "TO",
                  style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CardField(
                  width: 154,
                  hintText: '10:00PM',
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Experience in years",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        CardField(
            width: 327,
            hintText: "4",
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Align(alignment: Alignment.centerRight, child: Text("years")),
            )),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Service Area",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        CardField(width: 327, hintText: "Tijuana, Baja California "),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upload your services license",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        CardField(
          width: 327,
          hintText: "",
          suffixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerRight, child: InkWell(
                onTap: pickFile,
                  child: Text("Change",
                    style: TextStyle(
                        color: AppColors.lightBlueColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ),))),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upload your Certification",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: 5.h,
        ),
        CardField(
          width: 327,
          hintText: "",
          suffixIcon: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerRight, child: InkWell(
                onTap: pickFile,
                  child: Text("Change",
                  style: TextStyle(
                 color: AppColors.lightBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),))),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          btnText: "Save",
          onTap: () {},
        )
      ],
    );
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print("File picked: ${file.path}");
    } else {
      print("No file selected");
    }
  }

}

class CardField extends StatelessWidget {
  final double width;
  final String hintText;
  final Widget? suffixIcon;

  const CardField(
      {super.key,
      required this.width,
      required this.hintText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: width,
      decoration: BoxDecoration(
          // color: AppColors.darkGreyColor,
          ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                // color: AppColors.darkGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.lightBlueColor)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.lightBlueColor)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.lightBlueColor))),
      ),
    );
  }
}
