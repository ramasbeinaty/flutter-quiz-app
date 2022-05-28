import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges(); // used to check if there's any change in the auth state, aka if user logged in or not yet.
  final user = FirebaseAuth.instance.currentUser; // used to check if user is authenticated to do a specific action.

  // anoynymous firebase login, where user doesnt need to authenticate using username and pass
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      // handle the error
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}