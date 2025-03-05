import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.labelText,
      required this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.validator,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 327.w,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
          ),
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.greyColor, // Border color when not focused
              width: 1.0, // Border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor, // Border color when not focused
              width: 1.0, // Border width
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor, // Border color when not focused
              width: 1.0, // Border width
            ),
          ),
        ),
      ),
    );
  }
}
