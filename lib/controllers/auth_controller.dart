import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhu/provider/google_sign_in.dart';
import 'package:nhu/screens/home_screen.dart';
import 'package:nhu/screens/login_screen.dart';
import 'package:nhu/values/app_image.dart';
import 'package:provider/provider.dart';

class AuthController extends StatelessWidget {
  const AuthController({Key? key}) : super(key: key);
  static const routeName = '/auth-controller-screen';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final provider = Provider.of<GoogleSignInProvider>(context);
        if (provider.isSigningIn) {
          log('loading'.toUpperCase());
          return Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImage.flash),
                          fit: BoxFit.cover,
                          opacity: 0.9,
                        ),
                      ),
                    ),
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          log('snapshot connection state waiting'.toUpperCase());
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          log('snapshot has data'.toUpperCase());
          return const HomeScreen();
        } else if (snapshot.hasError) {
          log('snapshot has error'.toUpperCase());
          return const Center(child: Text('Something wrong !'));
        } else {
          log('snapshot else'.toUpperCase());
          return const LoginScreen();
        }
      },
    );
  }
}
