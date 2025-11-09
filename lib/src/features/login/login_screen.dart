import 'package:eticket/src/core/shared/widget/app_widgets/custom_button.dart';
import 'package:eticket/src/core/utils/context.dart';
import 'package:eticket/src/features/home/home_screen.dart';
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

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
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
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error), backgroundColor: Colors.red),
                      );
                    } else if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message), backgroundColor: Colors.green),
                      );
                      context.fadePushRemoveUntil(const HomeScreen());
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/noData.png', height: 150),
                        const SizedBox(height: 20),
                            // Checkbox: Is Master
                        Row(
                          children: [
                            Checkbox(
                              value: state.isMaster,
                              onChanged: (value) {
                                _loginBloc.add(IsMasterChanged(value ?? true));
                              },
                            ),
                            const Text("Super Admin Login"),
                          ],
                        ),

                        // Company ID (only if isMaster == false)
                        if (!state.isMaster)
                          TextFormField(
                            controller: _companyController,
                            decoration: const InputDecoration(labelText: "Company ID"),
                            onChanged: (value) {
                              _loginBloc.add(CompanyIdChanged(value));
                            },
                          ),

                        // Mobile Input
                        TextFormField(
                          controller: _mobileController,
                          decoration: const InputDecoration(labelText: "Mobile Number"),
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            _loginBloc.add(MobileChanged(value));
                          },
                        ),
                        const SizedBox(height: 10),

                        // Password Input
                        TextFormField(
                          controller: _passController,
                          decoration: const InputDecoration(labelText: "Password"),
                          obscureText: true,
                          onChanged: (value) {
                            _loginBloc.add(PasswordChanged(value));
                          },
                        ),
                        const SizedBox(height: 10),

                    

                        const SizedBox(height: 20),

                   CustomButton(
          isPrimary: true,
          btnText: state is LoginLoading ? 'Loading...' : 'Login',
    
   onTap: state is LoginLoading
      ? null
      : () {
          if (_formKey.currentState!.validate()) {
            final mobile = _mobileController.text.trim();
            final pass = _passController.text.trim();

            if (mobile.isEmpty || pass.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please enter phone & password")),
              );
              return;
            }

            _loginBloc.add(Submit(
              mobile: mobile,
              pass: pass,
            ));
          }
        },
  // child: state is LoginLoading
  //     ? const CircularProgressIndicator(color: Colors.white)
  //     : const Text("Login"),
),

                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
