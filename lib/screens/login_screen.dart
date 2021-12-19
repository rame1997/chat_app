import 'package:chat_app/Widgets/loading_view.dart';
import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: 'Sign in fail');
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: 'Sign in Canceled');
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: 'Sign in sucess');
        break;
      default:
        break;
    }
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset('images/back.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: InkWell(
                onTap: () async {
                  bool isScuccess = await authProvider.handleSignIn();
                  if (isScuccess) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Login By Google',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
          Positioned(
              child: authProvider.status == Status.authenticated
                  ? LoadingView()
                  : SizedBox.shrink())
        ],
      ),
    );
  }
}
