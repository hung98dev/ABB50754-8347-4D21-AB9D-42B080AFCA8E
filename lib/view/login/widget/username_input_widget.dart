import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importing app localizations for translated text

import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../configs/themes/theme_config.dart';

/// A widget representing the email input field.
class UserNameInput extends StatelessWidget {
  const UserNameInput({super.key, required this.focusNode});

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
                Icons.person,
                color: ThemeConfig.primaryColor,
              ),
              labelText: AppLocalizations.of(context)!
                  .aCompleteValidUserNameOrEmployyID,
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color:
                      ThemeConfig.primaryColor, // Màu khi focus
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
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12.0,
              ),
            ),
            onChanged: (value) {
              context.read<LoginBloc>().add(UserNameChanged(username: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'UserName/ID is not correct';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
          ),
        );
      },
    );
  }
}
