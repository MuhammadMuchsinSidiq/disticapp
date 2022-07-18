import 'dart:async';

import 'package:disticapp/provider/tiket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/sign-in'),
    );
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<TiketProvider>(context, listen: false).getTikets();
    Navigator.pushNamed(context, '/sign-in');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo_dishub.png'),
            ),
          ),
        ),
      ),
    );
  }
}
