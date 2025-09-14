import 'package:eticket/blocs/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassInput extends StatelessWidget {
  final FocusNode pass;
  const PassInput({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: pass,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'password', border: OutlineInputBorder()),
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChange(pass: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter password';
              }
              if (value.length < 6) {
                return "Please Enter Password geterthen 6 chr";
              }
              return null;
            },
            onFieldSubmitted: (value) {},
          );
        });
  }
}
