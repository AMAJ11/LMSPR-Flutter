import 'package:bloc/bloc.dart';

import '../repositry/CourseRepository.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository courseRepository;

  CourseCubit({required this.courseRepository}) : super(CourseInitial());

  void getAllCourses() async {
    emit(CourseLoading());
    try {
      final courses = await courseRepository.getCourses();
      emit(CourseSuccess(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}