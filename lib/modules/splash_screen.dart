import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pose_detection/layouts/app_layout.dart';
import 'package:pose_detection/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:pose_detection/shared/components/constants.dart';
import 'package:pose_detection/shared/network/local/cash_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  String? cashedEmail;
  String? cashedPassword;

  @override
  void initState() {
    Widget widget;

    token = CashHelper.getData(key: 'token') == null
        ? null
        : CashHelper.getData(key: 'token');
    widget = MySplashScreen();
    if (token != null) {
      widget = AppLayout();
    } else {
      cashedEmail = CashHelper.getData(key: 'email') == null
          ? null
          : CashHelper.getData(key: 'email');
      cashedPassword = CashHelper.getData(key: 'password') == null
          ? null
          : CashHelper.getData(key: 'password');

      print('$cashedEmail cashedEmail');
      print('$cashedPassword cashedPassword');

      widget = LoginScreen(cashedEmail:cashedEmail ,cashedPassword: cashedPassword,);
    }
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => widget)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      "LET'S CREATE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "OWN STYLE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Each man has a unique style, We help you to create your own style because you deserve to chine like a star",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Image(
                      image: AssetImage("assets/images/1.png"),
                    ),
                  ],
                ),
              ),
            ),
            const Image(
              image: AssetImage(
                "assets/images/startNow.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: Text(
                "Start Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
