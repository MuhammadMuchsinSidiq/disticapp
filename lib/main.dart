import 'package:disticapp/pages/cart_page.dart';
import 'package:disticapp/pages/checkout_page.dart';
import 'package:disticapp/pages/checkout_success.dart';
import 'package:disticapp/pages/destinasion_page.dart';
import 'package:disticapp/pages/detail_chat.dart';
import 'package:disticapp/pages/edit_profile.dart';
import 'package:disticapp/pages/home/main_page.dart';
import 'package:disticapp/pages/home/wishlist_page.dart';
import 'package:disticapp/pages/product_page.dart';
import 'package:disticapp/pages/sign_in_page.dart';
import 'package:disticapp/pages/sign_up_page.dart';
import 'package:disticapp/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/wishlist-page': (context) => WishlistPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/destination': (context) => DestinationPage(),
        '/cart-page': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
