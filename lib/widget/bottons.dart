import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class BottonsShered extends StatelessWidget {
  BottonsShered({
    required this.text,
  });
  String text;
  
  //final String? Function(String?)? onTap;
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      height: 40,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      color: Colors.green[300],
      //child: const Color.fromARGB(52, 244, 161, 1),
    );
  }
}

class FacebookBottons extends StatelessWidget {
  const FacebookBottons({
    super.key, required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: double.infinity,
        height: 60,
        child: SignInButton(
          Buttons.facebook,
          text: "Sign up with Google",
          elevation: 8,
          onPressed:onPressed,
        ),
      ),
    );
  }
}

class GoogleBottons extends StatelessWidget {
  const GoogleBottons({
    super.key, required this.onPressed
  });
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: double.infinity,
        height: 60,
        child: SignInButton(
          Buttons.googleDark,
          text: "Sign up with Google",
          elevation: 8,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
