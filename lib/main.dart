import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmspr/repositry/CourseRepository.dart';
import 'package:lmspr/screens/HomeScreen.dart';
import 'package:lmspr/services/CourseService.dart';
import 'cubit/course_cubit.dart';

void main() {
  runApp(const FluidScholarApp());
}

class FluidScholarApp extends StatelessWidget {
  const FluidScholarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluid Scholar',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xfff8f9fe),
      ),
      home: BlocProvider(
        create: (context) => CourseCubit(
          courseRepository: CourseRepository(courseService: CourseService()),
        )..getAllCourses(),
        child: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen(),
        ),
      ),
    );
  }
}