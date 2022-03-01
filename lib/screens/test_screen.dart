// import 'dart:math';

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhu/values/app_font.dart';
import 'package:nhu/values/app_image.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test-screen';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

bool check = false;

class _TestScreenState extends State<TestScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _top = _height / 2.h, _left = _width / 1.61.w;
    List _listTop = [
      _height / 50.h,
      _height / 20.h,
      _height / 12.h,
      _height / 9.h,
      _height / 7.h,
      _height / 6.h,
      _height / 4.h,
      // _height / 2.1.h,
      _height / 1.75.h,
      _height / 1.6.h,
      _height / 1.45.h,
      _height / 1.17.h,
      _height / 1.1.h,
      _height / 1.04.h,
    ];
    List _listLeft = [
      _left = _width / 1.25.w,
      _left = _width / 1.41.w,
      // _left = _width / 4.3.w,
      _left = _width / 5.8.w,
      _left = _width / 8.6.w,
      _left = _width / 14.w,
      _left = 2 * _width / 3.28.w,
    ];

    List<String> _listQuestion = [
      "Bạn có biết Thảo Như xinh hông ?",
      "Bạn có chia sẻ đồ ăn với Thảo Như hông ?",
      "Thảo Như đáng yêu lắm, bạn có biết hông ?",
      "Bạn có thấy ghen tị với Thảo Như hông ?",
      "Bạn có biết Thảo Như xinh hơn bạn hông ?",
      "Thảo Như tốt bụng lắm, bạn có biết không ?",
      "Ban có thấy Thảo Như ăn ở hiền lành, tốt bụng hông ?",
      "Bạn có biết Thảo Như siêng năng hông ?",
      "Thảo Như có hay giúp bạn hông ?",
      "Thảo Như có đáng tin hông ?",
    ];

    String _question = _listQuestion[i];

    if (check) {
      int randomTop = Random().nextInt(_listTop.length);
      int randomLeft = Random().nextInt(_listLeft.length);
      _top = _listTop[randomTop];
      _left = _listLeft[randomLeft];
    }

    int number = i * 10;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: Text(
          " Điểm số của bạn : $number ",
          style: TextStyle(
            fontFamily: AppFont.montserrat,
            fontSize: 15.sp,
            letterSpacing: 0.7,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.test),
                fit: BoxFit.cover,
                // opacity: 0.7,
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 10.h, left: 10.h),
          //   child: Text(
          //     " Điểm số của bạn: $number ",
          //     style: TextStyle(
          //       fontFamily: AppFont.montserrat,
          //       fontSize: 15.sp,
          //       backgroundColor: Colors.black.withOpacity(0.4),
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Câu hỏi " + (i + 1).toString() + " ",
                  style: TextStyle(
                    fontFamily: AppFont.montserrat,
                    fontSize: 16.sp,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  " " + _question + " ",
                  style: TextStyle(
                    fontFamily: AppFont.montserrat,
                    fontSize: 17.sp,
                    color: Colors.pink[300],
                    backgroundColor: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 150.h),
              ],
            ),
          ),
          Positioned(
            top: _height / 2.h,
            left: _width / 2.4.w,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (i < _listQuestion.length - 1) {
                    // if (i < _listQuestion.length - 1) {
                    i++;
                    check = false;
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Container(
                          height: _height / 7,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "WAOOO! Đúng gòi nè",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: AppFont.montserrat,
                                    color: Colors.green,
                                    // letterSpacing: 0.6,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: _height / 40),
                                Text(
                                  'Bạn được +10 điểm thân thiện nha !',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppFont.montserrat,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Next');
                            },
                            child: Text(
                              'Câu hỏi tiếp theo',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppFont.montserrat,
                                fontSize: 14.sp,
                                letterSpacing: 0.6,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.black12,
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    );
                  } else {
                    check = false;
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: SizedBox(
                          height: _height / 5,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  '❤ ❤ ❤ 100 ĐIỂM ❤ ❤ ❤',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppFont.montserrat,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: _height / 50),
                                Text(
                                  'Bạn đủ tiêu chuẩn làm bạn',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppFont.montserrat,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: _height / 50),
                                Text(
                                  'của Như gòi nha !',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppFont.montserrat,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: _height / 50),
                                Text(
                                  '❤ ❤ ❤',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppFont.montserrat,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/auth-controller-screen');
                            },
                            child: Text(
                              'Kết thúc bài kiểm tra',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppFont.montserrat,
                                fontSize: 14.sp,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.black12,
                              ),
                            ),
                          ),
                          SizedBox(width: 33.w),
                        ],
                      ),
                    );
                  }
                });
              },
              child: Text(
                " CÓ ",
                style: TextStyle(
                  fontFamily: AppFont.montserrat,
                  fontSize: 15.sp,
                  color: Colors.white,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: TextButton(
              onPressed: () {
                setState(() {
                  check = true;
                });
              },
              child: Text(
                " KHÔNG ",
                style: TextStyle(
                  fontFamily: AppFont.montserrat,
                  fontSize: 15.sp,
                  color: Colors.white,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: _height / 1.3,
            left: _width / 40,
            child: Text(
              "Love Nhu 3000",
              style: TextStyle(fontFamily: AppFont.montserrat, fontSize: 4.sp),
            ),
          ),
        ],
      ),
    );
  }
}
