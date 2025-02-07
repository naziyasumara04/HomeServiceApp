import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/payment_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedIndex;
  final List<Map<String, String>> paymentMethods = [
    {"image": AppImages.easyPaisa, "text": "Easypaisa"},
    {"image": AppImages.bankImg, "text": "Bank account"},
    {"image": AppImages.jazzCash, "text": "Jazz cash"},
    {"image": AppImages.payPal, "text": "PayPal"},
  ];

  void selectedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.lightBlueColor),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(
          "Payment",
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
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          paymentText(),
          SizedBox(height: 10.h,),
          paymentCont(),
          SizedBox(height: 20.h,),
          addNewCard(),
          SizedBox(height: 220.h,),
          CustomButton(btnText: "Save", onTap: () {},),
        ],
      ),
    );
  }

  Widget paymentText() {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select payment method",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ],
        ),
      );
  }

  Widget addNewCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.addNewCardScreen);
        },
        child: Container(
          height: 56.h,
          width: 327.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),

              border: Border.all(
                color: AppColors.lightBlueColor,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: AppColors.lightBlueColor,),
              SizedBox(
                width: 5.w,
              ),
              Text("Add new Card",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightBlueColor,
                    fontWeight: FontWeight.w700
                ),),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCont() {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
          itemCount: paymentMethods.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                PaymentWidget(
                  onTap: () {},
                  listImage: paymentMethods[index]["image"]!,
                  text: paymentMethods[index]["text"]!,
                  isSelected: selectedIndex == index,
                  onSelect: () {
                    selectedItem(index);
                  },
                ),
                SizedBox(height: 10.h,)
              ],
            );
          }),
    );
  }
}

// class PaymentCard extends StatelessWidget {
//   final String listImage;
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;
//   final VoidCallback onSelect;
//
//   // final IconData listIcon;
//
//   const PaymentCard({super.key,
//     required this.listImage,
//     required this.text,
//     required this.isSelected,
//     required this.onSelect, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 56.h,
//         width: 327.w,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           color: isSelected ? Colors.blue.shade100 : AppColors.whiteColor,
//           border: Border.all(
//             color: isSelected
//                 ? AppColors.lightBlueColor
//                 : AppColors.borderColor, // Border color
//             // width: 2.0, // Border thickness
//           ),
//         ),
//         child: ListTile(
//           onTap: onSelect,
//           leading: Image.asset(
//             listImage,
//             height: 25,
//             width: 25,
//           ),
//           title: Text(text),
//           trailing: Icon(
//             Icons.check,
//             color: isSelected ? AppColors.lightBlueColor : AppColors
//                 .borderColor,
//             size: 15,
//           ),
//         ),
//       ),
//     );
//   }
// }
