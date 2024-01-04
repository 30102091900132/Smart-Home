import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smart_home/constant/text_constant.dart';
import 'package:smart_home/screens/login_screen.dart';
import 'package:smart_home/widget/bottons.dart';
import 'package:smart_home/widget/vecters.dart';
import '../widget/divider_widget.dart';
import '../widget/text_form_field.dart';

class CreateNewAcount extends StatefulWidget {
  CreateNewAcount({super.key});

  @override
  State<CreateNewAcount> createState() => _CreateNewAcountState();
}

class _CreateNewAcountState extends State<CreateNewAcount> {
  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  RegExp regexPass =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RegExp regexEmail = RegExp(r'^(?=.*?[A-Z])');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 212, 123),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                          top: 50,
                          bottom: 32,
                        ),
                        child: Vectors(),
                      ),
                      ConstText(),
                    ],
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Looks like you don’t have an account. Let’s create a new account for you.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                    ),
                    child: TextFormFieldSherd(
                  
                       obscureText: false,
                      text: "Name",
                    
                      validat: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: TextFormFieldSherd(
                  
                      obscureText: false,
                      text: "Email",
                     
                    
                      validat: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: TextFormFieldSherd(
                      
                      obscureText:true,
                      text: "Password",
                      
                      validat: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return ("Password Must be more than 5 characters");
                        } else if (!regexPass.hasMatch(value)) {
                          return ("Password should contain upper,lower,digit and Special character");
                        } else if (value.length > 15) {
                          return "Password should not be greater than 15 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: ()async {
                         try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        // if (_formKey.currentState!.validate()) {
                         
                        //   print('the validate is ok');
                        // }
                      },
                      elevation: 0,
                      height: 40,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Create Acount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      color: Colors.green[300],
                      //child: const Color.fromARGB(52, 244, 161, 1),
                    ),
                  ),
                  // BottonsShered(text: 'LOGIN', onTap: (String? ) {  }, ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: DividerWidget(),
                  ),
                 
                   Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogIn()));
                      },
                      child: const Text.rich(TextSpan(children: [
                        // ignore: unnecessary_const
                        TextSpan(
                            text: "Have an acount? ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: "LogIn",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ))
                      ])),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
