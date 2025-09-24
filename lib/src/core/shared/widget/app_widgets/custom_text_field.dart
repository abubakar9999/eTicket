
import 'package:eticket/src/core/themes/color_scheme.dart';
import 'package:eticket/src/core/utils/all_size.dart';
import 'package:eticket/src/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomTextWithHeaderField extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final int maxLines;
  final bool isPassword, isError, isBangla;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final Function(String? text)? onChanged;
  final VoidCallback? onSuffixTap;
  final String? suffixIconUrl, prefixIconUrl, headerText;
  final IconData? prefixIcon; // ✅ Added for Material Icons
  final bool isSearch;
  final VoidCallback? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final double? borderRadius;
  final TextStyle? headerStyle;
  final String? Function(String?)? validator;

  const CustomTextWithHeaderField({
    super.key,
    this.hintText = '',
    this.errorText,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.isBangla = false,
    this.keyboardType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.fillColor = Colors.white,
    this.onSubmit,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.onTap,
    this.isIcon = false,
    this.isPassword = false,
    this.isError = false,
    this.suffixIconUrl,
    this.prefixIconUrl,
    this.headerText,
    this.prefixIcon, // ✅ Added
    this.isSearch = false,
    this.borderRadius,
    this.headerStyle,
    this.isReadOnly = false,
    this.validator,
  });

  @override
  State<CustomTextWithHeaderField> createState() =>
      _CustomTextWithHeaderFieldState();
}

class _CustomTextWithHeaderFieldState extends State<CustomTextWithHeaderField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.headerText != null) ...[
          Text(
            widget.headerText!,
            style: widget.headerStyle ??
                robotoBold.copyWith(
                  color: Theme.of(context).colorScheme.textColor,
                  fontSize: 12,
                ),
          ),
          const SizedBox(height: 4),
        ],
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.textColor,
              fontSize: AllSizes.fontSizeLarge),
          textInputAction: widget.inputAction,
          keyboardType: widget.keyboardType,
          cursorColor: Theme.of(context).colorScheme.textColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          readOnly: widget.isReadOnly,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.keyboardType == TextInputType.phone
              ? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
          ]
              : widget.isBangla
              ? []
              : [
            FilteringTextInputFormatter.allow(RegExp(
                r'^[\u0000-\u007F!@#$%^&*(),.?":{}|<>]+$'))
          ],
          decoration: InputDecoration(
            errorText: widget.errorText,
            hoverColor: Colors.grey[300],
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 22, 12),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                  color: widget.isError
                      ? Theme.of(context).colorScheme.redColor
                      : Theme.of(context).colorScheme.lightGray,
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                  color: widget.isError
                      ? Theme.of(context).colorScheme.redColor
                      : Theme.of(context).colorScheme.lightGray,
                  width: 1),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor ?? Colors.grey[300],
            hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: AllSizes.fontSizeDefault,
                color: Theme.of(context).colorScheme.lightGray),
            filled: true,
            // ✅ Priority: prefixIcon > prefixIconUrl
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon,
                color: Theme.of(context).colorScheme.textColor)
                : widget.prefixIconUrl != null
                ? Padding(
              padding: const EdgeInsets.only(
                  left: AllSizes.paddingSizeExtraSmall),
              child: SvgPicture.asset(
                widget.prefixIconUrl!,
                height: 20,
                width: 20,
              ),
            )
                : null,
            prefixIconConstraints: (widget.prefixIcon != null ||
                widget.prefixIconUrl != null)
                ? const BoxConstraints(minWidth: 38, maxHeight: 30)
                : const BoxConstraints(minWidth: 18, maxHeight: 22),
            suffixIcon: widget.isShowSuffixIcon
                ? widget.isPassword
                ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color:
                  Theme.of(context).hintColor.withOpacity(0.3),
                ),
                onPressed: _toggle)
                : widget.suffixIconUrl != null
                ? IconButton(
                onPressed: widget.onSuffixTap,
                icon: Image.asset(
                  widget.suffixIconUrl!,
                  width: 15,
                  height: 15,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color,
                ))
                : null
                : null,
          ),
          onTap: widget.onTap,
          validator: widget.validator,
          onFieldSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
              ? widget.onSubmit!()
              : null,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}


