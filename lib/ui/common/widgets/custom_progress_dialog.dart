import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';

class CustomProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeState _appTheme = AppTheme.of(context);
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
          color: _appTheme.blackColor.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(10.h))),
      child: Center(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: CircularProgressIndicator(
            strokeWidth: 8.w,
            valueColor: AlwaysStoppedAnimation<Color>(_appTheme.primaryColor),
          ),
        ),
      ),
    );
  }
}
