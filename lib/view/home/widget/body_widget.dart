// Nội dung cuộn
import 'package:flutter/material.dart';

import 'widgets.dart';

class ContentScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 200), // Đẩy nội dung xuống
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Các ô chức năng
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                FeatureCard(
                  color: Colors.blue,
                  icon: Icons.people,
                  title: 'Nhân sự',
                  subtitle: 'Quản lý nhân sự',
                  badgeCount: 13,
                ),
                FeatureCard(
                  color: Colors.green,
                  icon: Icons.person_add,
                  title: 'Tuyển dụng',
                  subtitle: 'CV đầu vào',
                  badgeCount: 2,
                ),
                FeatureCard(
                  color: Colors.yellow,
                  icon: Icons.file_copy,
                  title: 'Đơn từ',
                  subtitle: 'Đơn cần xử lý',
                  badgeCount: 6,
                ),
                FeatureCard(
                  color: Colors.pink,
                  icon: Icons.meeting_room,
                  title: 'Cuộc họp',
                  subtitle: 'Sắp diễn ra',
                  badgeCount: 1,
                ),
              ],
            ),
          ),
          // Bảng tin nội bộ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'Bảng tin nội bộ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const NewsCard(),
        ],
      ),
    );
  }
}
