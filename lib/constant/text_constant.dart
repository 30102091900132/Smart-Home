import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstText extends StatelessWidget {
  const ConstText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("CoShell", style: TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.black,
      fontSize: 32,
    ),);
  }
}