import 'package:flutter/material.dart';

class MostViewedCard extends StatelessWidget {
  const MostViewedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfff1f5f9),
        borderRadius: BorderRadius.circular(15),
      ),
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
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.computer, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}