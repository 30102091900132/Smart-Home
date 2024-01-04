import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldSherd extends StatelessWidget {
  TextFormFieldSherd({
    required this.text,
  
    required this.obscureText,
    this.IconData,
    this.validat,
    this.controller,
  });
  //=============================
  String text;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validat;
  final Icon? IconData;
   bool obscureText;
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      //onTap: onTap,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: text,
          prefixIcon: IconData,
        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      validator: validat!,
    );
  }
}
