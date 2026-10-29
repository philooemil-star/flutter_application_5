

import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/colors_manager.dart';
import 'package:flutter_application_5/core/styles_manager.dart';
import 'package:flutter_application_5/features/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightAgeCard extends StatelessWidget {
  final int weight;
  final int age;
  final bool isAge ;
  final void Function() increment ;
  final void Function() decrement ;
  const WeightAgeCard({super.key, required this.weight, required this.age, required this.isAge, required this.increment, required this.decrement});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsManager.cardColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( isAge ? "Age":"weight", style:  TextStyle(color: Colors.grey, fontSize: 20.sp)),
                          Text(isAge ? "$age":"$weight", style: StylesManager.whiteBold30.copyWith(fontSize: 40.sp)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(icon: Icons.remove, onPressed: decrement),
                               SizedBox(width: 15.w),
                              CustomIconButton(icon: Icons.add, onPressed: increment),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
  }
}