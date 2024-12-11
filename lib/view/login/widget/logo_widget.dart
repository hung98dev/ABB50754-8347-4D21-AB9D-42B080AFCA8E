import 'package:flutter/material.dart';
import 'package:hr_frontend/utils/extensions/general_ectensions.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: context.mediaQueryHeight * 0.15,
        ),
        SizedBox(height: context.mediaQueryHeight * 0.02),
        const Text(
          "Welcome!\nto HRM",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
