import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool showAll;
  final VoidCallback onViewAllPressed;

  const SectionTitle({
    Key? key,
    required this.title,
    required this.showAll,
    required this.onViewAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (showAll)
          TextButton(
            onPressed: onViewAllPressed,
            child: const Text('عرض الكل'),
          ),
      ],
    );
  }
}