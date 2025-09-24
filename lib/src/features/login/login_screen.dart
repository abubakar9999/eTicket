import 'package:eticket/src/features/login/blocs/login_bloc.dart';
import 'package:eticket/src/features/login/widgets/mobile_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';


class LogInScreen extends StatefulWidget {
   const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late LoginBloc _loginBloc;
  FocusNode mobile = FocusNode();
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
        body: BlocProvider(
          create: (_) => _loginBloc,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/noData.png',
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        MobileInput(
                          mobile: mobile,
                        ),
                        const SizedBox(
                          height: 10,
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
            ),
          ),
        ));
  }
}
