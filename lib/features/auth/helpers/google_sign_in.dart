import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle {
  signIn() {
    if (kIsWeb) {
      return _webSignInWithGoogle();
    }

    return _mobileSignInWithGoogle();
  }

  _webSignInWithGoogle() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      final UserCredential response = await auth.signInWithPopup(authProvider);
      String? accessToken = await response.user!.getIdToken();
      return accessToken;
    } catch (_) {
      return null;
    }
  }

  _mobileSignInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
      return null;
    }

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential response = await auth.signInWithCredential(credential);
    String? accessToken = await response.user?.getIdToken();

    if (accessToken == null) return null;
    return accessToken;
  }
}
