import 'package:dio/dio.dart';
import '../Basic/DioFactory.dart';

class CourseService {
  final DioClient _dioClient = DioClient();

  Future<Response> fetchRawCourses() async {
    //**************************************************
    return await _dioClient.get('courses');
  }
}