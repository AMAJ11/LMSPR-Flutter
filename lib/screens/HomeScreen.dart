import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _State();
}

class _State extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluid Scholar',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xfff8f9fe),
      ),

      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
    );
  }
}

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
                onViewAllPressed: () {
                  print('تم الضغط على عرض الكل للدورات الموصى بها');
                },
              ),
              const SizedBox(height: 12),
              const RecommendedCoursesSection(),
              const SizedBox(height: 25),

              SectionTitle(
                title: 'التصنيفات',
                showAll: false,
                onViewAllPressed: () {},
              ),
              const SizedBox(height: 12),
              const CategoriesSection(),
              const SizedBox(height: 25),

              SectionTitle(
                title: 'الأكثر مشاهدة',
                showAll: false,
                onViewAllPressed: () {},
              ),
              const SizedBox(height: 12),
              const MostViewedSection(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('تم الضغط على زر المحادثة');
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.chat_bubble, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}


class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Fluid Scholar',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff1d4ed8),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black54),
          onPressed: () {
            print('تم الضغط على الإشعارات');
          },
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            print('تم الضغط على الملف الشخصي');
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('مرحباً بك،', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text(
                      'أحمد محمود',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff1d4ed8)),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
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
            decoration: BoxDecoration(
              color: const Color(0xfff1f5f9),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'ماذا تريد أن تتعلم اليوم؟',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: () {
            print('تم الضغط على زر التصفية والفلترة');
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
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

  const SectionTitle({
    Key? key,
    required this.title,
    required this.showAll,
    required this.onViewAllPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        if (showAll)
          TextButton(
            onPressed: onViewAllPressed,
            child: const Text('عرض الكل', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
      ],
    );
  }
}

class RecommendedCoursesSection extends StatelessWidget {
  const RecommendedCoursesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            width: 240,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, spreadRadius: 2),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  print('تم الضغط على كارت الدورة الموصى بها رقم: $index');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xff0f172a),
                          ),
                          child: const Center(
                            child: Icon(Icons.code, size: 50, color: Colors.tealAccent),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                            child: const Text('الأكثر مبيعاً', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'أساسيات تطوير الويب الحديث',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Icon(Icons.access_time, size: 14, color: Colors.grey),
                              SizedBox(width: 4),
                              Text('12 ساعة', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              Spacer(),
                              Icon(Icons.star, size: 14, color: Colors.orange),
                              SizedBox(width: 4),
                              Text('4.9', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '\$89.00',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                              ),
                              InkWell(
                                onTap: () {
                                  print('تم الضغط على إضافة الدورة $index إلى السلة');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                                  child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 18),
                                ),
                              ),
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
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'البرمجة', 'icon': Icons.code, 'bg': const Color(0xffeff6ff), 'iconBg': Colors.white, 'color': Colors.blue},
      {'name': 'التصميم', 'icon': Icons.palette, 'bg': const Color(0xfffff7ed), 'iconBg': Colors.white, 'color': Colors.orange},
      {'name': 'الرياضيات', 'icon': Icons.calculate, 'bg': const Color(0xfff0fdf4), 'iconBg': Colors.white, 'color': Colors.green},
      {'name': 'اللغات', 'icon': Icons.translate, 'bg': const Color(0xfffaf5ff), 'iconBg': Colors.white, 'color': Colors.purple},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final item = categories[index];
        return Container(
          decoration: BoxDecoration(
            color: item['bg'] as Color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {
                print('تم الضغط على تصنيف: ${item['name']}');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: item['iconBg'] as Color,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
                    ),
                    child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['name'] as String,
                    style: TextStyle(fontWeight: FontWeight.bold, color: item['color'] as Color, fontSize: 14),
                  ),
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
    final courses = [
      {'title': 'علم البيانات للمبتدئين', 'instructor': 'بواسطة د. سارة العلي', 'price': '\$45.00', 'views': '12.5k'},
      {'title': 'الذكاء الاصطناعي في الأعمال', 'instructor': 'بواسطة م. خالد يوسف', 'price': '\$99.00', 'views': '8.2k'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final item = courses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xfff1f5f9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {
                print('تم الضغط على كورس الأكثر مشاهدة: ${item['title']}');
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(item['instructor']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(item['price']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 14)),
                              const SizedBox(width: 15),
                              const Icon(Icons.visibility, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text('${item['views']} مشاهدة', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.computer, color: Colors.white, size: 35),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 11),
      onTap: (index) {
        print('تم الضغط على العنصر رقم $index في شريط التنقل السفلي');
      },
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.home),
          ),
          label: 'الرئيسية',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'الجدول'),
        const BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'الدرجات'),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
        const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
      ],
    );
  }
}