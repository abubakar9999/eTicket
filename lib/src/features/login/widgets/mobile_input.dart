import 'package:eticket/src/core/shared/widget/app_widgets/custom_text_field.dart';
import 'package:eticket/src/features/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileInput extends StatelessWidget {
  final FocusNode mobile;
  final String mobiles;

  const MobileInput({Key? key, required this.mobile, required this.mobiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.mobile != current.mobile,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.phone,
          focusNode: mobile,
          onChanged: (value) {
            context.read<LoginBloc>().add(MobileChanged( value));
          },
          decoration: const InputDecoration(
            labelText: 'Mobile No',
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}