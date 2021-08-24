import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bronco_trucking/models/post.dart';
import 'package:bronco_trucking/di/app_core.dart';
import 'package:bronco_trucking/ui/common/widgets/app_theme.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    final post = Get.arguments as Post;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(StringConstants.profile,
                style: _appTheme.customTextStyle(
                    fontSize: 50,
                    color: _appTheme.whiteColor,
                    fontFamilyType: FontFamily.ProzaLibre,
                    fontWeightType: FontWeight.bold))),
        backgroundColor: _appTheme.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text(post.title ?? '')),
    );
  }
}
