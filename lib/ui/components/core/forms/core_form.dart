import 'package:app/ui/components/core/forms/core_input.dart';
import 'package:flutter/material.dart';

class CoreForm {
  late final int? columns;
  final List<CoreInput> inputs;
  CoreForm({this.columns, required this.inputs});
}

class CoreFormWidget extends StatelessWidget {
  final List<CoreInput> inputs;
  CoreFormWidget({super.key, required this.inputs});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: inputs
          .map((input) => CoreInputWidget(
                controller: input.controller,
                placeholder: input.placeholder,
              ))
          .toList(),
    );
  }
}
