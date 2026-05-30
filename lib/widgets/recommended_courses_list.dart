import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/course_cubit.dart';
import '../cubit/course_state.dart';

class RecommendedCoursesList extends StatelessWidget {
  const RecommendedCoursesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CourseError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          }
          if (state is CourseSuccess) {
            final courses = state.courses;
            if (courses.isEmpty) {
              return const Center(child: Text('لا توجد دورات حالياً'));
            }

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Container(
                  width: 240,
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 10,
                        )
                      ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            color: const Color(0xff0f172a),
                            child: const Center(
                              child: Icon(Icons.code, size: 50, color: Colors.tealAccent),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.title,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  course.category,
                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${course.price}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                    ),
                                    const Icon(Icons.add_shopping_cart, color: Colors.blue),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('جاري بدء التحميل...'));
        },
      ),
    );
  }
}