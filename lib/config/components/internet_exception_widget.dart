import 'package:eticket/config/color/colors.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const InternetExceptionWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: AppColors.redColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text('We`re unable to show results.\nPlease Check your data\nconnection.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
          ),
        ),
        ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'RETRY',
              style: Theme.of(context).textTheme.bodySmall,
            ))
      ],
    );
  }
}
