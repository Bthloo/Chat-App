import 'package:chat_app_hono/core/general_components/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/login/view/pages/login_screen.dart';
import 'features/register/view/pages/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(context),
        initialRoute: RegisterScreen.routeName,
        routes: {
           LoginScreen.routeName: (context) =>  const LoginScreen(),
           RegisterScreen.routeName: (context) =>  const RegisterScreen(),
        },
      ),
    );
  }
}
