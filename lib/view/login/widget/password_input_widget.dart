import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../configs/themes/theme_config.dart';

/// A widget representing the password input field.
class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color.fromARGB(255, 236, 236, 236),
          ),
          child: TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.lock,
                color: ThemeConfig.primaryColor, // Icon color
              ),
              labelText: AppLocalizations.of(context)!.password, // Label text
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: ThemeConfig.primaryColor, // Focus border color
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.transparent, // Không có viền
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.red, // Error border color
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12.0,
              ),
            ),
            obscureText: true, // Password obscured
            validator: (value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.enterPassword;
              }
              if (value.length < 6) {
                return AppLocalizations.of(context)!.passwordAtLeast6Characters;
              }
              return null;
            },
            onChanged: (value) {
              context
                  .read<LoginBloc>()
                  .add(PasswordChanged(password: value)); // Dispatching event
            },
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}
