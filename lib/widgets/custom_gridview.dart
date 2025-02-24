import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class CustomGridview extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CustomGridview({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: 0.7 / 1,
        ),
        itemBuilder: (context, int index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 116.h,
                    width: 124.w,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 84, 165, 0.3),
                        borderRadius: BorderRadius.circular(6)),
                    child: Image.asset(
                      item['imagepath'],
                      height: 110.h,
                      width: 72.w,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(item['title'],
                      style: Theme.of(context).textTheme.displayLarge
                      // TextStyle(fontWeight: FontWeight.bold)
                      ),
                  SizedBox(height: 4.h),
                  Text(item['subtitle'],
                      style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.lightBlueColor,
                          ),
                          Text(
                            item['rating'],
                            style: TextStyle(color: AppColors.lightBlueColor),
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        width: 70,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: AppColors.lightBlueColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: InkWell(
                          onTap: () {
                            print("Details clicked for ${item['title']}");
                          },
                          child: Text("Details",
                              style: TextStyle(color: AppColors.whiteColor)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
