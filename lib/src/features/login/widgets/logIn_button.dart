

import 'dart:developer';

import 'package:eticket/src/core/utils/context.dart';
import 'package:eticket/src/features/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/widget/app_widgets/custom_button.dart';
import '../../home/home_screen.dart';




class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomButton(
          isPrimary: true,
          btnText: state is LoginLoading ? 'Loading...' : 'Login',
          onTap: () {
            if (formKey.currentState!.validate()) {
              final loginState = context.read<LoginBloc>().state;

              // Log current values
              log("login button pressed");
              log("mobile: ${loginState.mobile}");
              log("password: ${loginState.password}");

              // Dispatch Submit event
              context.read<LoginBloc>().add(
                    Submit(
                      mobile: loginState.mobile,
                      pass: loginState.password,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
