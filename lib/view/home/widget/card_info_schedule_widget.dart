// Thẻ thông tin lịch trình
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Thứ 4',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '11/10',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('SA 8:30', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 8),
                    Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
                Row(
                  children: const [
                    Text('CH 13:30', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 8),
                    Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
              ],
            ),
            const Icon(Icons.qr_code_scanner, size: 30),
          ],
        ),
      ),
    );
  }
}