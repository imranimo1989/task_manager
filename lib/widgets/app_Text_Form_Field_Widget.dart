import 'package:flutter/material.dart';

class appTextEditingStyle extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obSecureText;
  final int? multiLine;
  final bool? readOnly;

  final Function(String)? onChanged;

  final String? Function(String?)? validator;

  const appTextEditingStyle({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obSecureText,
    this.multiLine,
    this.validator, this.onChanged, this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: multiLine ?? 1,
      obscureText: obSecureText ?? false,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly?? false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
