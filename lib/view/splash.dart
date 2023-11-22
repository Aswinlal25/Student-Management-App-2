import 'package:flutter/material.dart';
import 'package:my_app1/provider/flashpage_provider.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).goToLogin(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'asset/images/stdlogo2.png',
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}

