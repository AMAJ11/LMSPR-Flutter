import '../models/CourseModel.dart';
import '../services/CourseService.dart';

class CourseRepository {
  final CourseService courseService;

  CourseRepository({required this.courseService});

  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await courseService.fetchRawCourses();
      final List<dynamic> rawList = response.data;
      return rawList.map((json) => CourseModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}