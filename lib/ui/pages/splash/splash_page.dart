import 'package:app/controllers/splash_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:app/ui/components/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.black),
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(image: AssetImage('assets/gifs/background-animation.gif')),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyledText.displayLarge(
                    LanguageGlobalVar.appName.tr,
                    color: Colors.white,
                  ),
                  StyledText.headlineLarge(
                    LanguageGlobalVar.version
                        .trParams({'version': controller.version}),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
