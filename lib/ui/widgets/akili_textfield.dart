import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AkiliTextfield extends StatelessWidget {
  const AkiliTextfield({
    super.key,
    required this.name,
    required this.hintText,
    required this.prefixIcon,
    required this.labelText,
    required this.keyboardType,
    this.obscureText,
  });
  final String name;
  final String hintText;
  final IconData prefixIcon;
  final String labelText;
  final TextInputType keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        labelText: labelText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        fillColor: Colors.white,
        filled: true,
      ),
      keyboardType: keyboardType,
    );
  }
}
