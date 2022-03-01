import 'dart:convert';
import 'dart:developer';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhu/models/user.dart';
import 'package:nhu/provider/google_sign_in.dart';
import 'package:nhu/screens/test_screen.dart';
import 'package:nhu/values/app_font.dart';
import 'package:nhu/values/app_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  Future<User> getUser() async {
    final preferences = await SharedPreferences.getInstance();
    log(preferences.getString("user").toString());
    User user = User.fromJson(json.decode(preferences.getString("user")!));
    return user;
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.login),
                fit: BoxFit.cover,
                // opacity: 0.9,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 40.h),
              FutureBuilder<User>(
                future: getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    User user = snapshot.data as User;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircularProfileAvatar(
                                user.img,
                                radius: 40,
                                borderColor: Colors.white,
                                borderWidth: 2,
                                elevation: 2,
                              ),
                              GestureDetector(
                                child: const Icon(
                                  Icons.logout_sharp,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Center(
                                        child: Text(
                                          'Đồ quỷ xứ, đăng xuất hả ?',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: AppFont.montserrat,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'Cancel');
                                          },
                                          child: Text(
                                            'Hông bé ơi',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: AppFont.montserrat,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.black12,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            final provider = Provider.of<
                                                GoogleSignInProvider>(
                                              context,
                                              listen: false,
                                            );
                                            provider.googleSignOut();
                                            Navigator.pop(context, 'Cancel');
                                          },
                                          child: Text(
                                            'Đúng bé ơi',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: AppFont.montserrat,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.black12,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            " " + user.name + " ",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: AppFont.montserrat,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.pink.withOpacity(0.5),
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            " " + user.email + " ",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: AppFont.montserrat,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.pink.withOpacity(0.5),
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          const Divider(
                            thickness: 2,
                            color: Colors.white60,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  " Bài trắc nghiệm tình bạn ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    fontFamily: AppFont.montserrat,
                                    backgroundColor:
                                        Colors.black.withOpacity(0.4),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('/test-screen');
                                },
                                child: Text(
                                  " Làm ngay ",
                                  style: TextStyle(
                                    fontFamily: AppFont.montserrat,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    backgroundColor:
                                        Colors.blue.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),

                          // Positioned(
                          //   top: _height / 1.1,
                          //   left: _width / 2.52,
                          //   child: Text(
                          //     "Love Nhu 3000",
                          //     style: TextStyle(
                          //         fontFamily: AppFont.montserrat,
                          //         fontSize: 1.sp),
                          //   ),
                          // )
                          // ),
                          SizedBox(height: 200.h),
                          Text(
                            "Love Nhu 3000",
                            style: TextStyle(
                                fontFamily: AppFont.montserrat, fontSize: 4.sp),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    log(snapshot.error.toString());
                    return const Center(child: Text("HAS ERROR!"));
                  } else {
                    return const Center(child: Text("NOTHING!"));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
