import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignInWithApple {
  signIn() async {
    if (kIsWeb) {
      return await _webSignInWithApple();
    }

    return await _mobileSignInWithApple();
  }

  _webSignInWithApple() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    AppleAuthProvider authProvider = AppleAuthProvider();
    final UserCredential response = await auth.signInWithPopup(authProvider);
    String? accessToken = await response.user!.getIdToken();

    if (accessToken == null) return null;
    return accessToken;
  }

  _mobileSignInWithApple() async {
    try {
      AppleAuthProvider appleProvider = AppleAuthProvider();
      appleProvider = appleProvider.addScope('email');
      appleProvider = appleProvider.addScope('name');

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);

      if (userCredential.credential == null || userCredential.user == null) {
        return null;
      }

      String? accessToken = await userCredential.user?.getIdToken();

      if (accessToken == null) return null;
      return accessToken;
    } catch (e) {
      return null;
    }
  }
}
