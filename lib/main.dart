import 'package:flutter/material.dart';
import 'package:flutter_application_5/features/home/cubit/bmi_cubit.dart';
import 'package:flutter_application_5/features/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true ,
      splitScreenMode: true,
      builder: (_ , child) => MaterialApp(
          debugShowCheckedModeBanner: false, 
          home: BlocProvider(
            create: (context) => BmiCubit(),
            child: const HomeScreen(), 
          ),
        )
        );
  }
}