// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importing app localizations for translated text

import '../../../configs/themes/theme_config.dart';
import '../../../utils/extensions/flush_bar_extension.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../utils/enums.dart';
import '../../../utils/extensions/general_ectensions.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: state.message.toString());
        }

        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.main, (route) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (current, previous) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return SizedBox(
              width: context.mediaQueryWidth * 0.6,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: ThemeConfig.primaryColor)))),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      context.read<LoginBloc>().add(LoginApi());
                    }
                  },
                  child: state.postApiStatus == PostApiStatus.loading
                      ? const CircularProgressIndicator()
                      : Text(AppLocalizations.of(context)!.btnLogin)),
            );
          }),
    );
  }
}
