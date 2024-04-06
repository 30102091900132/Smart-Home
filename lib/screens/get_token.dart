import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Firebase_Messaging extends StatefulWidget {
  const Firebase_Messaging({super.key});
  static String id = 'Firebase_Messaging';
  @override
  State<Firebase_Messaging> createState() => _Firebase_MessagingState();
}

class _Firebase_MessagingState extends State<Firebase_Messaging> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getTokenDevise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("News App"),
      ),
    );
  }

  Future getTokenDevise() async {
    String? deviceToken = await firebaseMessaging.getToken();
    print('Device Token ${deviceToken}');
  }
}

