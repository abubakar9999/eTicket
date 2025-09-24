import 'package:eticket/src/core/utils/context.dart';
import 'package:eticket/src/features/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/widget/app_widgets/custom_button.dart';
import '../../home/home_screen.dart';




class LoginButton extends StatelessWidget {
  final formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return CustomButton(
            isPrimary: true,
            btnText: 'login',
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.fadePushRemoveUntil(  const HomeScreen());
                //Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false);

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (_) => const HomeScreen()),
                // );
              }
            },
          );
        });
  }
}
