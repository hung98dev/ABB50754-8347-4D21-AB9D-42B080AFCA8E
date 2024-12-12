// Card bảng tin
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/event.png', // Thay bằng ảnh của bạn
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Christmas Event with ABC Company\n16h30 - 24/12, c3 tower',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}