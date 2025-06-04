import 'package:flutter/material.dart';
import 'package:ppkdjp_flutter/constant/app_image.dart';
import 'package:ppkdjp_flutter/constant/app_style.dart';
import 'package:ppkdjp_flutter/helper/preference.dart';
import 'package:ppkdjp_flutter/meet_16/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      print("isLogin: $isLogin");
      // if (isLogin) {
      //   return Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     ThankYouPage.id,
      //     (route) => false,
      //   );
      // } else {
      // Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      // }
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreenApp.id,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Image.asset(AppImage.cat),
            SizedBox(height: 20),
            Text("Form App", style: AppStyle.fontBold()),
            Spacer(),
            SafeArea(
              child: Text("v1.0.0", style: AppStyle.fontNormal(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
