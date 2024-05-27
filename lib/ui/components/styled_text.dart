import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  late final TextStyle? Function(BuildContext context)? getStyle;

  StyledText.displayLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.displayLarge;
    };
  }

  StyledText.headlineLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.headlineLarge;
    };
  }

  StyledText.titleLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.titleLarge;
    };
  }

  StyledText.labelLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.labelLarge;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getStyle?.call(context));
  }
}
