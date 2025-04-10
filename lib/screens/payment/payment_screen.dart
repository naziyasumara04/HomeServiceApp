import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/payment/add_new_card_screen.dart';
import 'package:homeapp/screens/service_seeker/feedback_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/payment_widget.dart';

class PaymentScreen extends StatefulWidget {
  final Widget? row;

  const PaymentScreen({super.key, this.row});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedIndex;
  List<Widget> paymentWidgets = [];

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

  void addPaymentWidget() {
    setState(() {
      paymentWidgets.add(
        PaymentWidget(
          onTap: () {},
          listImage: AppImages.appLogo,
          text: "New Card",
          isSelected: false,
          onSelect: () {},
        ),
      );
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
          SizedBox(
            height: 10.h,
          ),
          paymentCont(),
          SizedBox(
            height: 20.h,
          ),
          widget.row ?? SizedBox(),
          addNewCard(),
          SizedBox(
            height: 220.h,
          ),
          CustomButton(
            btnText: (widget.row != null) ? "pay" : "Save",
            onTap: () {
              if (widget.row != null) {
                paymentReceived();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget paymentText() {
    return Padding(
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewCardScreen(
                        onTap: () {
                          // addPaymentWidget();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                        row: Text("row"),
                                        // add new card task pending
                                        // row: addPaymentWidget(),
                                      )));
                        },
                      )));
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
              Icon(
                Icons.add,
                color: AppColors.lightBlueColor,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Add new Card",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightBlueColor,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCont() {
    return SizedBox(
      height: 260.h,
      child: ListView(
        children: [
          ...paymentMethods.map((method) => PaymentWidget(
                onTap: () {},
                listImage: method["image"]!,
                text: method["text"]!,
                isSelected: selectedIndex == paymentMethods.indexOf(method),
                onSelect: () {
                  selectedItem(paymentMethods.indexOf(method));
                },
              )),
          ...paymentWidgets, // Display dynamically added widgets
        ],
      ),
      // child: ListView.builder(
      //     itemCount: paymentMethods.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Column(
      //         children: [
      //           PaymentWidget(
      //             onTap: () {},
      //             listImage: paymentMethods[index]["image"]!,
      //             text: paymentMethods[index]["text"]!,
      //             isSelected: selectedIndex == index,
      //             onSelect: () {
      //               selectedItem(index);
      //             },
      //           ),
      //           SizedBox(
      //             height: 10.h,
      //           ),
      //         ],
      //       );
      //     }),
    );
  }

  void paymentReceived() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    height: 300.h,
                    width: 327.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 70,
                          color: AppColors.lightBlueColor,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Payment successful",
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Payment of Plumber service \$200.00 has paid successfully",
                          // "Your order for the service of Electrician has received, The service Provider will arrived at 10:00AM.",
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          btnText: "Home",
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.dashboard);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackScreen()));
                          }
                          ,
                          child: Text("Give Feedback",
                          style: Theme.of(context).textTheme.displaySmall,),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
