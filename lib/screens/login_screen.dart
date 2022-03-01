import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhu/provider/google_sign_in.dart';
import 'package:nhu/values/app_font.dart';
import 'package:nhu/values/app_image.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        check = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
              Center(
                child: check
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              " Đăng nhập đi bé ơi ❤ ❤ ❤ ",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: AppFont.montserrat,
                                backgroundColor: Colors.black.withOpacity(0.3),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16.h),
                            GestureDetector(
                              child: Container(
                                width: 195.w,
                                height: 28.h,
                                decoration:
                                    const BoxDecoration(color: Colors.blue),
                                child: Row(
                                  children: [
                                    SizedBox(width: 2.5.w),
                                    Image.asset(
                                      AppImage.iconGoogle,
                                      height: 23.h,
                                      width: 23.h,
                                    ),
                                    SizedBox(width: 12.w),
                                    Text(
                                      "Đăng nhập bằng gút gồ",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.white,
                                        fontFamily: AppFont.montserrat,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.4.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(
                                  context,
                                  listen: false,
                                );
                                provider.googleSignIn();
                              },
                            )
                          ],
                        ),
                      )
                    : const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white54),
                      ),
              ),
              Positioned(
                top: _height / 1.3,
                left: _width / 2.18,
                child: Text(
                  "Love Nhu 3000",
                  style:
                      TextStyle(fontFamily: AppFont.montserrat, fontSize: 4.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
