import 'package:duofinance/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInProvider with ChangeNotifier {
  final Session session;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoading = false;

  SignInProvider({required this.session});

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  signInWithGoogle() async {
    isLoading = true;
    notifyListeners();

    // final SignInWithGoogle googleAuth = SignInWithGoogle();
    // String? accessToken = await googleAuth.signIn();
//do something
  }

  signInWithApple() async {
    isLoading = true;
    notifyListeners();

    // final SignInWithApple appleAuth = SignInWithApple();
    // String? accessToken = await appleAuth.signIn();
//do something
  }

  // _onError() {
  //   isLoading = false;
  //   notifyListeners();
  // }

  // _onSuccess(UpSignInDTO upSignInResponse) async {
  //   isLoading = false;
  //   await storage.write(key: key, value: value);
  //   session.logIn(upSignInResponse.user);
  //   notifyListeners();
  // }
}
