import 'package:flutter/material.dart';

class CoreInput {
  late final TextEditingController controller;
  late final String? placeholder;
  CoreInput({required this.controller, this.placeholder});
}

class CoreInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  CoreInputWidget({required this.controller, this.placeholder});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      controller: controller,
      decoration: InputDecoration(hintText: placeholder ?? ''),
    );
  }
}
