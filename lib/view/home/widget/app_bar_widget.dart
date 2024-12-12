// AppBar cố định
import 'package:flutter/material.dart';

class FixedAppBar extends StatelessWidget {
  const FixedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/avatar.png'), // Avatar
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Chào buổi sáng,',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'Bùi Quang Huy',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.search, color: Colors.white),
          const SizedBox(width: 8),
          const Icon(Icons.notifications, color: Colors.white),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}