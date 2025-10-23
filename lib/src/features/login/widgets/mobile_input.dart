import 'package:eticket/src/core/shared/widget/app_widgets/custom_text_field.dart';
import 'package:eticket/src/features/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileInput extends StatelessWidget {
  final FocusNode mobile;
  const MobileInput({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.mobile != current.mobile,
      builder: (context, state) {
        return CustomTextWithHeaderField(
          headerText: "Mobile No",
          keyboardType: TextInputType.phone,
          focusNode: mobile,
          hintText: 'Enter Mobile No',
          prefixIcon: Icons.phone_android,
          onChanged: (value) {
            
          
  context.read<LoginBloc>().add(MobileChanged(mobile:  value?? ''));

          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter mobile no';
            }
            if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
              return "Enter valid mobile no";
            }
            return null;
          },
        );



        TextFormField(
          keyboardType: TextInputType.phone,
          focusNode: mobile,
          decoration: const InputDecoration(
            hintText: 'Mobile Number',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(MobileChanged(mobile: value));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter mobile number';
            }
            if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
              return "Enter valid mobile number";
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
