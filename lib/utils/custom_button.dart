import 'package:eticket/config/themes/color_scheme.dart';
import 'package:eticket/utils/all_size.dart';
import 'package:eticket/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;
  final bool isColor, isPrimary, isLoading;
  final double height;
  final TextStyle? textStyle;
  final dynamic icon; // ✅ can be String (SVG path) or IconData
  final Color? bgColor, txtColor;

  const CustomButton({
    super.key,
    required this.btnText,
    required this.onTap,
    this.isColor = false,
    this.isPrimary = false,
    this.isLoading = false,
    this.height = 48,
    this.textStyle,
    this.icon,
    this.bgColor = Colors.blue,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor = txtColor ??
        (isColor
            ? Theme.of(context).colorScheme.textColor
            : isPrimary
            ? Theme.of(context).colorScheme.whiteColor
            : Theme.of(context).colorScheme.textColor);

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(
            horizontal: AllSizes.paddingSizeDefault,
            vertical: AllSizes.paddingSizeMiniSmall),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor ??
              (isColor
                  ? Theme.of(context).scaffoldBackgroundColor
                  : isPrimary
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.gray_20),
        ),
        child: isLoading
            ? SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(color: effectiveTextColor))
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon is IconData
                  ? Icon(icon, size: 24, color: effectiveTextColor) // ✅ Material Icon
                  : SvgPicture.asset(
                icon as String, // ✅ SVG asset
                height: 24,
                width: 24,
                color: effectiveTextColor,
              ),
              const SizedBox(width: 5),
            ],
            Text(
              btnText,
              style: textStyle ??
                  robotoRegular.copyWith(color: effectiveTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
