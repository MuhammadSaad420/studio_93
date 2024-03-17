import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hint,
      this.validator,
      this.isEnabled = true,
      this.autoValidate = false,
      this.keyboardType});
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final bool autoValidate;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      enabled: isEnabled,
      autovalidateMode:
          autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterText: " ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        labelText: hint,
      ),
    );
  }
}
