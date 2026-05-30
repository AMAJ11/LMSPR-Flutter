import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Fluid Scholar',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1d4ed8)),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
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
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}