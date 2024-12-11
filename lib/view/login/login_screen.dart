import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/extensions/general_ectensions.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../main.dart';
import 'widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _setupFocusNodeListeners();
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );
  }

  void _setupFocusNodeListeners() {
    void handleFocusChange(FocusNode focusNode) {
      if (focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 400), () {
          _animationController.forward();
        });
      } else {
        _animationController.reverse();
      }
    }

    _usernameFocusNode.addListener(() => handleFocusChange(_usernameFocusNode));
    _passwordFocusNode.addListener(() => handleFocusChange(_passwordFocusNode));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(authApiRepository: getIt()),
      child: _buildLoginScreenContent(context),
    );
  }

  Widget _buildLoginScreenContent(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: keyboardHeight > 0 ? keyboardHeight + 50 : 0,
              ),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => _buildLoginForm(context, keyboardHeight),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, double keyboardHeight) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        children: [
          SizedBox(height: context.mediaQueryHeight * 0.1),
          const LogoHeader(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: EdgeInsets.only(
              top: Tween<double>(
                begin: context.mediaQueryHeight * 0.16,
                end: keyboardHeight > 0 ? 0 : context.mediaQueryHeight * 0.08,
              ).evaluate(_animation),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  UserNameInput(focusNode: _usernameFocusNode),
                  PasswordInput(focusNode: _passwordFocusNode),
                  const SizedBox(height: 10),
                  SubmitButton(formKey: _formKey),
                ],
              ),
            ),
          ),
          BlocProvider.value(
            value: BlocProvider.of<LoginBloc>(context),
            child: const ForgotPassword(),
          ),
        ],
      ),
    );
  }
}