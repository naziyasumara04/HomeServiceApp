import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import "package:intl/intl.dart";
import 'package:intl_phone_field/intl_phone_Field.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/custom_button.dart';

class EditSeekerProfile extends StatefulWidget {
  const EditSeekerProfile({super.key});

  @override
  State<EditSeekerProfile> createState() => _EditSeekerProfileState();
}

class _EditSeekerProfileState extends State<EditSeekerProfile> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? selectedCountry;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

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
          "Edit profile",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.lightBlueColor),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(children: [
        editProfilePic(),
        SizedBox(
          height: 20,
        ),
        textFieldCont(),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          btnText: 'Save',
          onTap: () {
            // print("saved");
          },
        )
      ]),
    );
  }

  Widget editProfilePic() {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 96,
            width: 96,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                AppImages.profileImg,
              ),
              // child: Image.asset(AppImages.profileImg)
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldCont() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Name"),
            ],
          ),
          Field(
            hintText: "Mahrama",
            // labelText: "Enter Name",
            keyboardType: TextInputType.name,
            controller: _nameController,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email",
              ),
            ],
          ),
          Field(
            controller: _emailController,
            // labelText: "Enter Email",
            hintText: "mahrama@gmail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Date of Birth"),
            ],
          ),
          Field(
            hintText: "Date of birth",
            // labelText: "Date of Birth",
            controller: _dateController,

            suffixIcon: IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.date_range)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Country"),
            ],
          ),
          Field(
            // onTap: () {
            //   showCountryPicker(
            //     context: context,
            //     showPhoneCode: false,
            //     onSelect: (Country country) {
            //       setState(() {
            //         selectedCountry = country.name;
            //       });
            //     },
            //   );
            // },
            hintText: selectedCountry ?? "Choose a country",
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: false, // Set to true if you need country codes
                  onSelect: (Country country) {
                    setState(() {
                      selectedCountry = country.name;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Phone Number"),
            ],
          ),
          IntlPhoneField(
            decoration: InputDecoration(
                // labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightBlueColor))),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              // print(phone.completeNumber);
            },
          )
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const Field(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.suffixIcon,
      this.controller,
      this.labelText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 347,
      child: TextField(
        onTap: onTap,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.lightBlueColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlueColor),
            // borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlueColor),
            // borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
