// import 'package:eticket/blocs/bloc/login_bloc.dart';
// import 'package:eticket/utils/custom_button.dart';
// import 'package:eticket/views/home/home_screen.dart' hide CustomButton;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginButton extends StatelessWidget {
//   final formKey;
//   const LoginButton({super.key, required this.formKey});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//         buildWhen: (previous, current) => false,
//         builder: (context, state) {
//           return CustomButton(
//             isPrimary: true,
//             btnText: 'login',
//             onTap: () {
//               if (formKey.currentState!.validate()) {
//                 Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false);

//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(builder: (_) => const HomeScreen()),
//                 // );
//               }
//             },
//           );
//         });
//   }
// }
