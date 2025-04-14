import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UploadDocScreen extends StatefulWidget {
  final VoidCallback onNext;

  const UploadDocScreen({super.key, required this.onNext});

  @override
  State<UploadDocScreen> createState() => _UploadDocScreenState();
}

class _UploadDocScreenState extends State<UploadDocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Text(
                "We need a few Documents.",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Upload your services license",
                style: GoogleFonts.poppins(
                    color: AppColors.darkGreyColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              SizedBox(
                height: 10.h,
              ),
              UploadButton(),
              SizedBox(
                height: 10.h,
              ),
              Text("Upload your Certification"),
              SizedBox(
                height: 10.h,
              ),
              UploadButton(),
              SizedBox(
                height: 170.h,
              ),
              CustomButton(
                btnText: "Next",
                onTap: widget.onNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class UploadButton extends StatefulWidget {
//   const UploadButton({super.key});
//
//   @override
//   State<UploadButton> createState() => _UploadButtonState();
// }
//
// class _UploadButtonState extends State<UploadButton> {
//   File? _image;
//
//   String getImageName(File imageFile) {
//     return imageFile.path.split('/').last; // Extract filename from path
//   }
//
//   Future<void> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile =
//         await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//        // getImageName(_image!);
//       });
//
//       // Get app's directory (Example usage of path_provider)
//       Directory appDir = await getApplicationDocumentsDirectory();
//       print("App Directory: ${appDir.path}");
//       print("Selected Image Path: ${_image!.path}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: pickImage,
//       child: Container(
//         height: 56,
//         width: 327,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//             color: AppColors.lightBlueColor,
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.add,
//               size: 24,
//               color: AppColors.lightBlueColor,
//             ),
//             SizedBox(
//               width: 15.w,
//             ),
//
//             _image != null
//                 ? Text(getImageName(_image!))
//                 : Text(
//                     "Upload",
//                     style: GoogleFonts.poppins(
//                         color: AppColors.lightBlueColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class AppColors {
//   static const Color lightBlueColor = Colors.blue; // Define your color
// }

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
      Directory appDir = await getApplicationDocumentsDirectory();

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
            if(_image==null)
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
                  Text(_imageName!,
                  style: GoogleFonts.poppins(
                    color:AppColors.lightBlueColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),),
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
