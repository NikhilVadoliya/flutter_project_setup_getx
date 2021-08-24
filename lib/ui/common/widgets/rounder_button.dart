import 'package:bronco_trucking/di/app_core.dart';
import 'package:bronco_trucking/enum/font_type.dart';
import 'package:bronco_trucking/ui/common/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class RounderButton extends StatelessWidget {
  final Function onPress;
  final String? text;

  const RounderButton({
    required this.onPress,
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress.call(),
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppTheme.of(context).primaryColor,
                AppTheme.of(context).redColor,
              ],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            text ?? 'Button',
            style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.OpenSans,
                fontSize: 40.sp,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
