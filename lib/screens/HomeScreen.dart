import 'package:flutter/material.dart';
import '../widgets/categories_grid.dart';
import '../widgets/header_section.dart';
import '../widgets/most_viewed_card.dart';
import '../widgets/recommended_courses_list.dart';
import '../widgets/search_bar_section.dart';
import '../widgets/section_title.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const SearchBarSection(),
              const SizedBox(height: 25),

              SectionTitle(
                title: 'الدورات الموصى بها',
                showAll: true,
                onViewAllPressed: () {},
              ),
              const SizedBox(height: 12),
              const RecommendedCoursesList(), // المكون المستقل المربوط بالـ Cubit

              const SizedBox(height: 25),
              SectionTitle(title: 'التصنيفات', showAll: false, onViewAllPressed: () {}),
              const SizedBox(height: 12),
              const CategoriesGrid(),

              const SizedBox(height: 25),
              SectionTitle(title: 'الأكثر مشاهدة', showAll: false, onViewAllPressed: () {}),
              const SizedBox(height: 12),
              const MostViewedCard(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.chat_bubble, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'الجدول'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'الدرجات'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
      ],
    );
  }
}









































/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/course_cubit.dart';
import '../cubit/course_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const SearchBarSection(),
              const SizedBox(height: 25),
              SectionTitle(
                title: 'الدورات الموصى بها',
                showAll: true,
                onViewAllPressed: () {},
              ),
              const SizedBox(height: 12),
              const RecommendedCoursesSection(), // هنا يحدث الربط الديناميكي
              const SizedBox(height: 25),
              SectionTitle(title: 'التصنيفات', showAll: false, onViewAllPressed: () {}),
              const SizedBox(height: 12),
              const CategoriesSection(),
              const SizedBox(height: 25),
              SectionTitle(title: 'الأكثر مشاهدة', showAll: false, onViewAllPressed: () {}),
              const SizedBox(height: 12),
              const MostViewedSection(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.chat_bubble, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

// --- مقتطفات المكونات الفرعية التفاعلية ---

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Fluid Scholar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1d4ed8))),
        const SizedBox(width: 8),
        IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        const Spacer(),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('مرحباً بك،', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text('أحمد محمود', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff1d4ed8))),
                ],
              ),
              const SizedBox(width: 10),
              const CircleAvatar(radius: 22, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: const Color(0xfff1f5f9), borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const TextField(
              decoration: InputDecoration(hintText: 'ماذا تريد أن تتعلم اليوم؟', border: InputBorder.none, icon: Icon(Icons.search)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final bool showAll;
  final VoidCallback onViewAllPressed;
  const SectionTitle({Key? key, required this.title, required this.showAll, required this.onViewAllPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // تم التعديل والإصلاح بنجاح هنا
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (showAll) TextButton(onPressed: onViewAllPressed, child: const Text('عرض الكل')),
      ],
    );
  }
}

// قسم الدورات الموصى بها مربوط بالـ Cubit
class RecommendedCoursesSection extends StatelessWidget {
  const RecommendedCoursesSection({Key? key}) : super(key: key);

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
            return Center(child: Text(state.errorMessage, style: const TextStyle(color: Colors.red, fontSize: 12)));
          }
          if (state is CourseSuccess) {
            final courses = state.courses;
            if (courses.isEmpty) return const Center(child: Text('لا توجد دورات حالياً'));

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Container(
                  width: 240,
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                            child: const Center(child: Icon(Icons.code, size: 50, color: Colors.tealAccent)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                                const SizedBox(height: 6),
                                Text(course.category, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${course.price}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
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

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'البرمجة', 'icon': Icons.code, 'bg': const Color(0xffeff6ff), 'color': Colors.blue},
      {'name': 'التصميم', 'icon': Icons.palette, 'bg': const Color(0xfffff7ed), 'color': Colors.orange},
      {'name': 'الرياضيات', 'icon': Icons.calculate, 'bg': const Color(0xfff0fdf4), 'color': Colors.green},
      {'name': 'اللغات', 'icon': Icons.translate, 'bg': const Color(0xfffaf5ff), 'color': Colors.purple},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.4, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final item = categories[index];
        return Container(
          decoration: BoxDecoration(color: item['bg'] as Color, borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData, color: item['color'] as Color, size: 24),
                  const SizedBox(height: 10),
                  Text(item['name'] as String, style: TextStyle(fontWeight: FontWeight.bold, color: item['color'] as Color)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MostViewedSection extends StatelessWidget {
  const MostViewedSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xfff1f5f9), borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('علم البيانات للمبتدئين', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('بواسطة د. سارة العلي', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Container(width: 75, height: 75, decoration: BoxDecoration(color: Colors.blueGrey[800], borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.computer, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'الجدول'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'الدرجات'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
      ],
    );
  }
}*/