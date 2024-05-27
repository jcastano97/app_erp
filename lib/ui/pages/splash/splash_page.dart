import 'package:app/controllers/splash_controller.dart';
import 'package:app/language/language_global_var.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/styled_text.dart';

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
                  StyledText.displayLarge("Code AI Journey"),
                  StyledText.headlineLarge(LanguageGlobalVar.version
                      .trParams({'version': controller.version})),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
