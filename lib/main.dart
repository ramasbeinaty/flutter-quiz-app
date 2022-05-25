import 'package:flutter/material.dart';
import 'package:quizapp/routes.dart';
import 'package:quizapp/theme.dart';

void main() {
  runApp( const myApp());
}

class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      routes: appRoutes,
      theme: appTheme,
    );
  }
}