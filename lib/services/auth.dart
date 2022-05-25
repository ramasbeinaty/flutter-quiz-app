import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges(); // used to check if there's any change in the auth state, aka if user logged in or not yet.
  final user = FirebaseAuth.instance.currentUser; // used to check if user is authenticated to do a specific action.
}