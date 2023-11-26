
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10, ),
          child: Text('OR'),
        ),
        Expanded(child: Divider(
          thickness: 1,
          color: Colors.black,
        ),)
      ],
    );
  }
}