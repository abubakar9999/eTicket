import 'package:eticket/blocs/bloc/login_bloc.dart';
import 'package:eticket/utils/custom_text_field.dart';
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
        return CustomTextWithHeaderField(
          headerText: "Password",
          hintText: 'Enter Password',
          focusNode: pass,
          isPassword: true, // ✅ enables visibility toggle
          isShowSuffixIcon: true, // ✅ show eye icon
          prefixIcon: Icons.lock,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(pass: value ?? ""));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
          // onFieldSubmitted: (value) {
          //   // you can handle submit or move to next field here
          // },
        );
      },
    );
  }
}




// import 'package:eticket/blocs/bloc/login_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class PassInput extends StatelessWidget {
//   final FocusNode pass;
//   const PassInput({super.key, required this.pass});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//         buildWhen: (previous, current) => previous.password != current.password,
//         builder: (context, state) {
//           return TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             focusNode: pass,
//             obscureText: true,
//             decoration: const InputDecoration(hintText: 'password', border: OutlineInputBorder()),
//             onChanged: (value) {
//               context.read<LoginBloc>().add(PasswordChanged(pass: value));
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Enter password';
//               }
//               if (value.length < 6) {
//                 return "Please Enter Password geterthen 6 chr";
//               }
//               return null;
//             },
//             onFieldSubmitted: (value) {},
//           );
//         });
//   }
// }
