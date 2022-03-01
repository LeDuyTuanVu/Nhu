import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhu/controllers/auth_controller.dart';
import 'package:nhu/controllers/user_controller.dart';
import 'package:nhu/provider/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nhu/screens/home_screen.dart';
import 'package:nhu/screens/login_screen.dart';
import 'package:nhu/screens/test_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  // Connect firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Nhu());
}

class Nhu extends StatelessWidget {
  const Nhu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GoogleSignInProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserController(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          initialRoute: AuthController.routeName,
          routes: {
            AuthController.routeName: (context) => const AuthController(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            TestScreen.routeName: (context) => const TestScreen(),
          },
        ),
      ),
    );
  }
}
