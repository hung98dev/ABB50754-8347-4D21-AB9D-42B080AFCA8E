import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../configs/themes/theme_config.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current, previous) =>
            current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {},
            child: Text(
              'Quên mật khẩu',
              style: TextStyle(
                color: ThemeConfig.primaryColor,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          );
        });
  }
}
