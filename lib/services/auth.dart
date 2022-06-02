import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizapp/services/firestore.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges(); // used to check if there's any change in the auth state, aka if user logged in or not yet.
  final user = FirebaseAuth.instance.currentUser; // used to check if user is authenticated to do a specific action.

  // anoynymous firebase login, where user doesnt need to authenticate using username and pass
  Future<void> anonLogin() async {
    try {
      final anonUser = await FirebaseAuth.instance.signInAnonymously();

      FirestoreService().createUserReport(anonUser.user!.uid);

      // print("anonUser UID: "+ anonUser.user!.uid);

    } on FirebaseAuthException catch (e) {
      // handle the error
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
        // handle error
    }
  }
}