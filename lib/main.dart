import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/cart/CartPage.dart';
import 'package:flutter_ecommerce_app/pages/splashPage/splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'dart:ui';
import 'appTheme/apptheme.dart';
import 'pages/login/login.dart';
import 'pages/productDetail/product_detail_view.dart';
import 'pages/productGrid/product_grid.dart';
import 'pages/signpage/signup.dart';

import 'package:device_preview/device_preview.dart';

void main() =>
    runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'App Title',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      material: (_, __) => MaterialAppData(
        theme: MyTheme.appThemeData,
      ),
      cupertino: (_, __) => CupertinoAppData(
        theme: MyTheme.iosThemeData,
      ),
      home: Splash(),
      routes: {
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/gridpage": (context) => GridPage(),
        "/prductDetailView": (context) => ProductDetailsView(),
      },
    );
  }
}
