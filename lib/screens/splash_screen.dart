import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      checkSignIn();
    });
    // TODO: implement initState
    super.initState();
  }

  void checkSignIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggIn = await authProvider.isLoggedIn();
    if (isLoggIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/splash.png',
              width: 300,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "WeDeliver",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: ColorConstants.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
