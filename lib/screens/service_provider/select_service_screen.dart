import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/electrician_card.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Selected Service"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            ElectricianCard(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Provide Specific Instructions or Details",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            textFieldContainer(hintText: "Write here", height: 114.h),
            SizedBox(
              height: 30.h,
            ),
            _uploadButton(),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.wiringInstallationMap);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _uploadButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload picture of the place",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 10,
        ),
        UploadButton()
      ],
    );
  }

  Widget textFieldContainer({required String hintText, double? height}) {
    return Container(
      height: height ?? 56, // Enforce container height
      width: 327.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        // Ensures the border remains visible
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: height ?? 56, // Force TextField to respect height
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(top: 8, left: 12),
            // Adjust hint text alignment
            border: InputBorder
                .none, // Remove default border to prevent extra padding
          ),
        ),
      ),
    );
  }
}

class UploadButton extends StatefulWidget {
  const UploadButton({super.key});

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  File? _image;
  String? _imageName; // Stores the selected image name

  // Function to extract file name from path
  String getImageName(File imageFile) {
    return imageFile.path.split('/').last; // Extract filename from path
  }

  // Function to pick an image
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageName = getImageName(_image!);
      });

      // Debugging Logs
      // Directory appDir = await getApplicationDocumentsDirectory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: Container(
        height: 56.h, // Responsive height
        width: 327.w, // Responsive width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.lightBlueColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(width: 15.w),
            if (_image == null)
              Text(
                "+  Upload",
                // Show image name if selected, else "Upload"
                style: GoogleFonts.poppins(
                  color: AppColors.lightBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            if (_image !=
                null) // Show "Change" button only when an image is selected
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _imageName!,
                    style: GoogleFonts.poppins(
                        color: AppColors.lightBlueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 30.w), // Space between text and button
                  GestureDetector(
                    onTap: pickImage, // Allow changing the image
                    child: Text(
                      "Change",
                      style: GoogleFonts.poppins(
                        color: AppColors.lightBlueColor,
                        // Highlight change button in red
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
