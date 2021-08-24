import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bronco_trucking/models/post.dart';
import 'package:bronco_trucking/di/app_core.dart';
import 'package:bronco_trucking/ui/common/routes.dart';
import 'package:bronco_trucking/ui/common/widgets/app_theme.dart';
import 'package:bronco_trucking/ui/common/widgets/shimmer_widget.dart';
import 'package:bronco_trucking/ui/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(StringConstants.posts,
                  style: _appTheme.customTextStyle(
                      fontSize: 50,
                      color: _appTheme.whiteColor,
                      fontFamilyType: FontFamily.ProzaLibre,
                      fontWeightType: FontWeight.bold))),
          backgroundColor: _appTheme.primaryColor,
        ),
        body: SafeArea(
            bottom: false,
            child: Obx(() => controller.apiStatus.value.isOk
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return _getPostWidget(
                          controller.postList[index], _appTheme);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70.w),
                        child: Divider(
                          thickness: 2.h,
                          color: _appTheme.dividerColor,
                        ),
                      );
                    },
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    itemCount: controller.postList.isNotEmpty
                        ? controller.postList.length
                        : 0)
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return _getPostShimmer(_appTheme);
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70.w),
                        child: Divider(
                          thickness: 2.h,
                          color: _appTheme.dividerColor,
                        ),
                      );
                    },
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    itemCount: 20))));
  }

  Widget _getPostShimmer(AppThemeState _appTheme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
      child: Column(
        children: <Widget>[
          ShimmerWidget(width: double.infinity, height: 50.h, borderRadius: 5),
          SizedBox(height: 10.h),
          ShimmerWidget(width: double.infinity, height: 50.h, borderRadius: 5),
        ],
      ),
    );
  }

  Widget _getPostWidget(Post? post, AppThemeState _appTheme) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.profilePage, arguments: post);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                      child: Text(post?.title ?? '',
                          style: _appTheme.customTextStyle(
                              fontSize: 38,
                              color: _appTheme.blackColor,
                              fontFamilyType: FontFamily.ProzaLibre,
                              fontWeightType: FontWeight.bold))),
                  SizedBox(height: 10.h),
                  Flexible(
                      child: Text(post?.body ?? '',
                          style: _appTheme.customTextStyle(
                              fontSize: 32,
                              color: _appTheme.blackColor.withOpacity(0.5),
                              fontFamilyType: FontFamily.ProzaLibre,
                              fontWeightType: FontWeight.w400))),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            SvgPicture.asset(
              SVGPath.menu,
              color: _appTheme.blackColor,
              width: 30.h,
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
