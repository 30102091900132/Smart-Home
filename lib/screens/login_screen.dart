import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smart_home/constant/text_constant.dart';
import 'package:smart_home/screens/create_acount.dart';
import 'package:smart_home/screens/room.dart';
import 'package:smart_home/widget/bottons.dart';
import 'package:smart_home/widget/vecters.dart';

import '../widget/divider_widget.dart';
import '../widget/text_form_field.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 191, 212, 123),
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
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: TextFormFieldSherd(
                      obscureText: false,
                      text: "Email",
                      IconData: const Icon(Icons.email),
                      validat: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: TextFormFieldSherd(
                      obscureText: true,
                      text: "Password",
                      IconData: const Icon(Icons.lock),
                      validat: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        MinLengthValidator(6,
                            errorText:
                                "Password should be atleast 6 characters"),
                        MaxLengthValidator(15,
                            errorText:
                                "Password should not be greater than 15 characters")
                      ]),
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: ()  {
                       
                         // ignore: use_build_context_synchronously
                         if(_formKey.currentState!.validate()){
                           Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Rooms()));

                         }
                        
                      },
                      elevation: 0,
                      height: 40,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.green[300],
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      //child: const Color.fromARGB(52, 244, 161, 1),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: DividerWidget(),
                  ),
                  GoogleBottons(onPressed: () {}),
                  FacebookBottons(
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewAcount()));
                      },
                      child: const Text.rich(TextSpan(children: [
                        // ignore: unnecessary_const
                        TextSpan(
                            text: "Dont have acount? ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: "Register",
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
