import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:homeapp/widgets/payment_widget.dart';

class PaymentMethodProviderScreen extends StatefulWidget {

  final VoidCallback onNext;

  const PaymentMethodProviderScreen({super.key, required this.onNext});

  @override
  State<PaymentMethodProviderScreen> createState() =>
      _PaymentMethodProviderScreenState();
}

class _PaymentMethodProviderScreenState
    extends State<PaymentMethodProviderScreen> {
  int isSelectedIndex = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void handleSelection(int index) {
    setState(() {
      isSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Payment method ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              PaymentWidget(
                  listImage: AppImages.easyPaisa,
                  text: "Easypaisa",
                  isSelected: isSelectedIndex == 0,
                  onTap: () => handleSelection(0)),
              SizedBox(
                height: 15.h,
              ),
              PaymentWidget(
                  listImage: AppImages.bankImg,
                  text: "Bank account",
                  isSelected: isSelectedIndex == 1,
                  onTap: () => handleSelection(1)),
              SizedBox(
                height: 15.h,
              ),
              PaymentWidget(
                  listImage: AppImages.jazzCash,
                  text: "Jazz cash",
                  isSelected: isSelectedIndex == 2,
                  onTap: () => handleSelection(2)),
              SizedBox(
                height: 15.h,
              ),
              PaymentWidget(
                  listImage: AppImages.payPal,
                  text: "PayPal",
                  isSelected: isSelectedIndex == 3,
                  onTap: () => handleSelection(3)),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(btnText: "Next",onTap: widget.onNext,)
            ],
          ),
        ),
      ),
    );
  }
}
