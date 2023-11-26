
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vectors extends StatelessWidget {
  const Vectors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
       height: 85,
       width: 80,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
      ),
       child: Column(
         children: [
           Image.asset('assets/images/Vector 3.png' , ),
           Image.asset('assets/images/Vector 5.png',),
           Image.asset('assets/images/Vector 6.png',),
           Image.asset('assets/images/Vector 4.png',),
         ],
       ),
     );
  }
}
// child: Stack(
// // mainAxisAlignment: MainAxisAlignment.end,
// children: [
// //OverflowBar(),
// Positioned(
// top: 280,
// left: 145,
// child:  Image.asset('assets/images/Vector 3.png'),
// ),
// Positioned(
// top: 292,
// left: 150,
// child: Image.asset('assets/images/Vector 5.png'),),
// Positioned(
// top: 305,
// left: 155,
// child: Image.asset('assets/images/Vector 6.png'), ),
// Positioned(
// top: 310,
// left: 155,
// child: Image.asset('assets/images/Vector 4.png'),),
//
//
//
// ],
// ),

// Stack(
// children:[
// Positioned(
// top: 280,
// left: 145,
// child: Container(
// height: 70,
// width: 70,
//
// decoration: BoxDecoration(
// color: Colors.grey ,
// image: DecorationImage(image: AssetImage('assets/images/Vector 5.png')),
// ),
//
// ),
// ),
// Positioned(
// top: 292,
// left: 150,
// child: Container(
// // height: 200,
// // width: 200,
//
// decoration: BoxDecoration(
// // color: Colors.grey ,
// image: DecorationImage(image: AssetImage('assets/images/Vector 5.png')),
// ),
//
// ),
// ),
// Positioned(
// top: 305,
// left: 150,
// child: Container(
// // height: 200,
// // width: 200,
//
// decoration: BoxDecoration(
// // color: Colors.grey ,
// image: DecorationImage(image: AssetImage('assets/images/Vector 4.png')),
// ),
//
// ),
// ),
// Positioned(
// top: 310,
// left: 155,
// child: Container(
// // height: 200,
// // width: 200,
//
// decoration: BoxDecoration(
// color: Colors.grey ,
// image: DecorationImage(image: AssetImage('assets/images/Vector 5.png')),
// ),
//
// ),
// ),
// ]
//
//
// ),