import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldSherd extends StatelessWidget {
  TextFormFieldSherd({
    required this.text , this.suffix,
    required this.passwordVisible,
      this.onTap,
     this.validat,
    this.controller}) ;
  //=============================
   String text ;
  TextEditingController? controller =TextEditingController();
  //TextEditingController password=TextEditingController();
  //String text_desc;
   //late Function() onTap;
  final String? Function(String?)? validat;
  final Function()? onTap;
    bool passwordVisible = false ;
  final Icon? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        onTap: onTap,
        obscureText: !passwordVisible,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

          )
      ),
      validator: validat!,

    );
  }
}