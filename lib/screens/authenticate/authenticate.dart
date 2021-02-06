import 'package:flutter/material.dart';
import 'package:project_progress_app/screens/authenticate/register.dart';
import 'package:project_progress_app/screens/authenticate/sign_in.dart';

class Authentication extends StatefulWidget {
  final Function toggleView;
  Authentication({this.toggleView});

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
