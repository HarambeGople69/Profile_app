import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/homepages.dart';

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Powered By:",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35),
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: ScreenUtil().setSp(400),
            height: ScreenUtil().setSp(400),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void completed() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
