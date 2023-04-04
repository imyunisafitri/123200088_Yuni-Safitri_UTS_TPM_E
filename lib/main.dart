import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS TPM - 123200088',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginApp(),
    );
  }
}