import '../models/CourseModel.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}
class CourseLoading extends CourseState {}
class CourseSuccess extends CourseState {
  final List<CourseModel> courses;
  CourseSuccess(this.courses);
}
class CourseError extends CourseState {
  final String errorMessage;
  CourseError(this.errorMessage);
}