import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nhu/models/user.dart' as user_db;
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleLogin = GoogleSignIn();
  late GoogleSignInAccount _user;
  late bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  GoogleSignInAccount get getUser => _user;

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future googleSignIn() async {
    isSigningIn = true;
    final googleUser = await googleLogin.signIn();
    if (googleUser == null) {
      isSigningIn = false;
      log('google user null'.toUpperCase());
      return;
    }
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    isSigningIn = false;
    user_db.User user = user_db.User(
      name: _user.displayName!,
      img: _user.photoUrl!,
      email: _user.email,
      id: _user.id,
    );
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("user", json.encode(user));
    log('google user not null'.toUpperCase());
    notifyListeners();
  }

  Future googleSignOut() async {
    await googleLogin.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
