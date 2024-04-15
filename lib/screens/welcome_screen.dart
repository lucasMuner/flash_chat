import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/buttonMaterial.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation?.value * 80,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        speed: Duration(milliseconds: 200),
                      )
                    ],
                    totalRepeatCount: 1,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonMaterial(
              elevation: 5.0,
              borderRadius: 30.0,
              verticalPadding: 16.0,
              color: Colors.lightBlueAccent,
              text: 'Log in',
              minWidth: 200.0,
              height: 42,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ButtonMaterial(
              elevation: 5.0,
              borderRadius: 30.0,
              verticalPadding: 16.0,
              color: Colors.blueAccent,
              text: 'Register',
              minWidth: 200.0,
              height: 42,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
