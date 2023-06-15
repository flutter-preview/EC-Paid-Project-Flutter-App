import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/PlaceOrderPage/placeorder.dart';
import 'package:flutter_ecommerce_app/forgetPassPage/forgetPassPage.dart';
import 'package:flutter_ecommerce_app/pages/billingDetailsPage/billingDetails.dart';
import 'package:flutter_ecommerce_app/pages/homePage/homePage.dart';
import 'package:flutter_ecommerce_app/pages/cart/CartPage.dart';
import 'package:flutter_ecommerce_app/pages/mainPage/main_page.dart';
import 'package:flutter_ecommerce_app/pages/orderhistoryPage/orderHistory.dart';
import 'package:flutter_ecommerce_app/pages/paymentOrCash/payment_or_cash.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/update_profile_page.dart';
import 'package:flutter_ecommerce_app/pages/splashPage/splash.dart';
import 'package:flutter_ecommerce_app/pages/termsAndConditionsPage/tos.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'addressPage/address_add.dart';
import 'appTheme/apptheme.dart';
import 'googleMap/google_map.dart';
import 'pages/login/login.dart';
import 'pages/orderDetailPage/order_detail.dart';
import 'pages/productDetail/product_detail_view.dart';
import 'pages/productGrid/product_grid.dart';
import 'pages/qrcode/qr.dart';
import 'pages/signpage/signup.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:device_preview/device_preview.dart';

import 'reduxStore/app_state.dart';
import 'reduxStore/reducer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );
  runApp(
      DevicePreview(enabled: false, builder: (context) => MyApp(store: store)));
  // MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: PlatformApp(
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
          home:HomePage(),
          routes: {
            "/splash": (context) => Splash(),
            "/login": (context) => LoginPage(),
            "/signup": (context) => SignupPage(),
            '/mainPage': (context) => MainPage(),
            "/homePage": (context) => HomePage(),
            "/gridPage": (context) =>
                GridPage(arguments: ModalRoute.of(context)?.settings.arguments as String),
            "/productDetail": (context) => ProductDetailsView(
                arguments:
                    ModalRoute.of(context)?.settings.arguments as String),
            "/cart": (context) => CartPage(),
            "/qr": (context) => const QRCodeScanner(),
            "/orderHistory": (context) => OrderHistory(),
            "/orderDetail": (context) => OrderDetailPage(
                arguments:
                    ModalRoute.of(context)?.settings.arguments as String
            ),
            "/addressPage": (context) => AddAddressPage(),
            "/paymentOrCash": (context) => PaymentOrCashPage(),
            "/forgetPass": (context) => 
            
            ForgetPassPage(),
            "/orderPlaced": (context) => 
            
            OrderPlacedPage(),
            "/map": (context) => MapPage(),
            "/updateProfilePage": (context) => UpdateProfilePage(),
            "/tos": (context) => TermsAndConditionsPage(),
            "/billingDetailsPage": (context) => BillingDetailsPage()
          },
        ));
  }
}
