import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/cart/CartPage.dart';
import 'package:flutter_ecommerce_app/pages/splashPage/splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:ui';
import 'appTheme/apptheme.dart';
import 'pages/login/login.dart';
import 'pages/productDetail/product_detail_view.dart';
import 'pages/productGrid/product_grid.dart';
import 'pages/qrcode/qr.dart';
import 'pages/signpage/signup.dart';


import 'package:device_preview/device_preview.dart';

import 'reduxStore/app_state.dart';
import 'reduxStore/reducer.dart';


void main() {

     final store=Store<AppState>(
      appReducer,
      initialState:AppState.initialState(),
    );
 runApp(
  DevicePreview(
    enabled:false,
    builder:(context)=>
    MyApp(store:store))
    );
}


  class MyApp extends StatelessWidget {
    final Store<AppState> store;
  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,   
    child:PlatformApp(
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
        "/productDetail": (context) => ProductDetailsView(),
        "/cart": (context) => CartPage(),
        "/qr": (context) =>QRCodeScanner(),
      },
    )
    );
  }
  }