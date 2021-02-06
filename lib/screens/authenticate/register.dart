import 'package:flutter/material.dart';
import 'package:project_progress_app/screens/authenticate/sign_in.dart';
import 'package:project_progress_app/screens/home/home.dart';
import 'package:project_progress_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/d.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Registration',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "example@email.com",
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!value.contains('@')) {
                    return 'Email is invalid';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter the password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 character';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.blueGrey,
              ),
              child: MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    bool shouldNavigate = await register(
                        _emailController.text, _passwordController.text);
                    if (shouldNavigate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Already have account?'),
                  FlatButton(
                    textColor: Colors.red,
                    child: Text('Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
