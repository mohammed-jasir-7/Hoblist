import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geeks/injectable.dart';
import 'package:geeks/services/auth_services.dart';
import 'package:geeks/views/colors.dart';
import 'package:geeks/views/sign%20up%20screen/signup_screen.dart';

import '../custom widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    validation(context: context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: hobsPrimary,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 1.5,
              child: Hero(
                transitionOnUserGestures: true,
                tag: "logo",
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height:
                  size.height > size.width ? size.height / 4 : size.height / 5,
            ),
            CustomText(
              content: 'version 1.0',
              colour: whiteColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}

Future validation({required BuildContext context}) async {
  await Future.delayed(Duration(seconds: 5));
  await getIt<AuthService>().dbInit();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => SignUpScreen(),
      ),
      (route) => false);
}
