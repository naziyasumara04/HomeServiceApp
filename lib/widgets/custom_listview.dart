import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class CustomListview extends StatelessWidget {
  final List<Map<String, String>> items;

  const CustomListview({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, int index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(right:10),
              child: Container(
                height: 100.h,
                width: 100.h,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(

                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Image.asset(item['imagepath']!),
                    Text(item['text']!,
                    style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
