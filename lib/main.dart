import 'package:flutter/material.dart';
import 'package:project_progress_app/screens/authenticate/authenticate.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(accentColor: Colors.orange, primarySwatch: Colors.blue),
      home: Authentication(),
    );
  }
}
