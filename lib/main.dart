import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/screens/create_acount.dart';
import 'package:smart_home/screens/home_screen.dart';
import 'package:smart_home/screens/login_screen.dart';
import 'package:smart_home/widget/vecters.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
// this function to describe stat of user loggedIn or loggedOUt
// authStateChanges()
  @override
  void initState() {
    FirebaseAuth.instance                    // this function to describe stat of user loggedIn or loggedOUt
                                            // authStateChanges()
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('********************************* User is currently signed out!');
    } else {
      print('********************************* User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CreateNewAcount(),
      // flutter.targetSdkVersion
    );
  }
}


