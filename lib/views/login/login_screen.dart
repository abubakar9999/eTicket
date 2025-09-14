import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc/login_bloc.dart';
import 'widgets/widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late LoginBloc _loginBloc;
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: BlocProvider(
          create: (_) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EmailInput(
                      email: email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PassInput(pass: pass),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginButton(
                      formKey: _formKey,
                    )
                  ],
                )),
          ),
        ));
  }
}
