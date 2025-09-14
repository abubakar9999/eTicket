import 'dart:io';

import 'package:eticket/config/color/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaddingWidget extends StatefulWidget {
  final double size;
  const LoaddingWidget({super.key, this.size = 60});

  @override
  State<LoaddingWidget> createState() => _LoaddingWidgetState();
}

class _LoaddingWidgetState extends State<LoaddingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: widget.size, width: widget.size, child: Platform.isAndroid ? const CircularProgressIndicator(color: AppColors.buttonColor) : const CupertinoActivityIndicator(color: AppColors.buttonColor));
  }
}
