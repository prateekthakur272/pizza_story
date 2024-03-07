import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validatior;
  final FocusNode? focusNode;
  final String? errorMessage;
  final String? Function(String?)? onChange;
  final VoidCallback? onTap;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText,
      required this.keyboardType,
      this.focusNode,
      this.errorMessage,
      this.suffixIcon,
      this.prefixIcon,
      this.validatior,
      this.onChange,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      validator: validatior,
      onChanged: onChange,
      focusNode: focusNode,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.red.shade400)
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        errorText: errorMessage,
      ),
    );
  }
}
