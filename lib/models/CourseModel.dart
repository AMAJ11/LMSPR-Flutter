class CourseModel {
  final String id;
  final String teacherId;
  final String title;
  final String description;
  final String category;
  final double price;
  final List<LessonModel> lessons;
  final String status;

  CourseModel({
    required this.id,
    required this.teacherId,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.lessons,
    required this.status,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'] ?? '',
      teacherId: json['teacher_id'] ?? '',
      title: json['title'] ?? 'رياضيات',
      description: json['description'] ?? '',
      category: json['category'] ?? 'عام',
      price: (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? 'pending',
      lessons: (json['lessons'] as List? ?? [])
          .map((lesson) => LessonModel.fromJson(lesson))
          .toList(),
    );
  }
}

class LessonModel {
  final String title;
  final String contentType;
  final String videoUrl;
  final String pdfUrl;

  LessonModel({
    required this.title,
    required this.contentType,
    required this.videoUrl,
    required this.pdfUrl,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      title: json['title'] ?? '',
      contentType: json['contentType'] ?? '',
      videoUrl: json['video_content']?['url'] ?? '',
      pdfUrl: json['pdf_content']?['url'] ?? '',
    );
  }
}