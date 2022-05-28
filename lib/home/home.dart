import 'package:flutter/material.dart';
import 'package:quizapp/login/login.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       child: Text('About'),
    //       onPressed: () => Navigator.pushNamed(context, '/about'),
    //     )
    //   )
    // );

    // add a listener to the authentication stream set.
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        // if waiting for authentication, show loading screen
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text('Loading'),
            );

          // else if couldnt authenticate, display an error message
        } else if (snapshot.hasError){
          return const Center (
            child: Text('Error, couldnt login'),
            );

          // else if authentication was successful, show topics screen
        }else if (snapshot.hasData) {
          return const TopicsScreen();

          // else if logged out, show the login screen
        } else {
          return const LoginScreen();
        }
    } 
    );
  }
}