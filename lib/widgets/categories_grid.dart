import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

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
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData, color: item['color'] as Color, size: 24),
                  const SizedBox(height: 10),
                  Text(
                    item['name'] as String,
                    style: TextStyle(fontWeight: FontWeight.bold, color: item['color'] as Color),
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