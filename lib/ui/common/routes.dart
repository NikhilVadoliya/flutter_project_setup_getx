import 'package:flutter/material.dart';
import 'package:bronco_trucking/ui/dashboard/dashboard_page.dart';
import 'package:bronco_trucking/ui/dashboard/profile_detail/profile_page.dart';
import 'package:bronco_trucking/ui/login/login_page.dart';
import 'package:get/get.dart';

class RouteName {
  // Base routes
  static const String root = '/';
  static const String profilePage = '/profile';
  static const String loginPage = '/login';
  static const String dashboard = '/dashboard';
}

class Routes {
  static final commonRoutes = <String, WidgetBuilder>{};

  static final routes = [
    GetPage(
      page: () => LoginPage(),
      name: RouteName.root,
    ),
    GetPage(
      page: () => ProfilePage(),
      name: RouteName.profilePage,
    ),
    GetPage(
      page: () => DashboardPage(),
      name: RouteName.dashboard,
    )
  ];
}
