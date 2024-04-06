import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:smart_home/constant/color_constant.dart';

import '../constant/text_constant.dart';
import '../widget/bottons.dart';
import '../widget/vecters.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/IMG_3360.JPG')),
                // color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                )
              ),
            ),
            //Vectors(),
            SizedBox(height: 100,),
             ConstText(),
            const Text("A new way to control smart home", style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 16,
            ),),


           // const Spacer(),

            SizedBox(height: 20,),
            Text("Test conflict"),
          ],
        ),
      ) ,

    );
  }
}





