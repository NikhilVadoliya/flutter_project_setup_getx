import 'package:bronco_trucking/ui/common/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bronco_trucking/di/app_core.dart';

class BroncoTextFormField extends StatelessWidget {
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final IconData? leftIcon;
  final String? hintText;
  final String? errorText;
  final TextStyle? style;
  final bool obscureText;

  const BroncoTextFormField(
      {Key? key,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.controller,
      this.leftIcon,
      this.hintText,
      this.errorText,
      this.style,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      obscureText: obscureText,
      cursorColor: Colors.black,
      style: style ??
          TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily:FontFamily.OpenSans,
              fontSize: 40.sp),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          icon: leftIcon != null
              ? Icon(
                  leftIcon,
                  color: AppTheme.of(context).primaryColor,
                )
              : const Offstage(),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorText: errorText),
    );
  }
}
