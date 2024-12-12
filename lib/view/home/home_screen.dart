// Màn hình chính
import 'package:flutter/material.dart';

import 'widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Nội dung cuộn
          ContentScroll(),
          // AppBar cố định
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: FixedAppBar(),
          ),
          // Thẻ thông tin lịch trình
          const Positioned(
            top: 140,
            left: 16,
            right: 16,
            child: ScheduleCard(),
          ),
        ],
      ),
    );
  }
}
