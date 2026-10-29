import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_5/core/colors_manager.dart';
import 'package:flutter_application_5/core/styles_manager.dart';
import 'package:flutter_application_5/features/home/widgets/weight_age_card.dart';
import '../result/result_screen.dart';
import 'cubit/bmi_cubit.dart';
import 'cubit/bmi_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BmiCubit(),
      child: BlocBuilder<BmiCubit, BmiStates>(
        builder: (context, state) {
          BmiCubit cubit = BmiCubit.get(context);

          return Scaffold(
            backgroundColor: ColorsManager.primaryColor,
            appBar: AppBar(
              backgroundColor: ColorsManager.primaryColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "BMI Calculator",
                style: StylesManager.whiteBold30,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(15.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeGender(true);
                            },
                            child: GenderCard(
                              icon: Icons.male,
                              title: "Male",
                              color: cubit.isMale
                                  ? ColorsManager.cardColor
                                  : ColorsManager.inactiveCardColor,
                            ),
                          ),
                        ),
                         SizedBox(width: 15.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeGender(false);
                            },
                            child: GenderCard(
                              icon: Icons.female,
                              title: "Female",
                              color: !cubit.isMale
                                  ? ColorsManager.cardColor
                                  : ColorsManager.inactiveCardColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: ColorsManager.cardColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Height",
                            style: TextStyle(color: Colors.grey, fontSize: 20.sp)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(cubit.height.round().toString(),
                                style: StylesManager.whiteBold30
                                    .copyWith(fontSize: 40.sp)),
                             Text("cm",
                                style: TextStyle(color: Colors.grey, fontSize: 20.sp)),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            thumbColor: ColorsManager.bottomButtonColor,
                            overlayColor: ColorsManager.bottomButtonColor
                                .withValues(alpha: 0.2),
                          ),
                          child: Slider(
                            value: cubit.height,
                            min: 100,
                            max: 220,
                            onChanged: (newValue) {
                              cubit.changeHeight(newValue);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(15.w),
                    child: Row(
                      children: [
                        WeightAgeCard(
                          age: cubit.age,
                          weight: cubit.weight,
                          isAge: false,
                          increment: () {
                            cubit.incrementWeight();
                          },
                          decrement: () {
                            cubit.decrementWeight();
                          },
                        ),
                         SizedBox(width: 15.w),
                        WeightAgeCard(
                          age: cubit.age,
                          weight: cubit.weight,
                          isAge: true,
                          increment: () {
                            cubit.incrementAge();
                          },
                          decrement: () {
                            cubit.decrementAge();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70.h,
                  margin:  EdgeInsets.only(top: 10.h),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.bottomButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      double bmi = cubit.weight / ((cubit.height / 100) * (cubit.height / 100));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(bmiResult: bmi),
                        ),
                      );
                    },
                    child:  Text("Calculate", style: StylesManager.whiteBold30),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const GenderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 80.sp),
          SizedBox(height: 10.h),
          Text(title, style:  TextStyle(color: Colors.grey, fontSize: 25.sp)),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      constraints:  BoxConstraints.tightFor(width: 45.w, height: 45.h),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
     child: Icon(icon, color: Colors.white, size: 24.sp),
      
    );
  }
}