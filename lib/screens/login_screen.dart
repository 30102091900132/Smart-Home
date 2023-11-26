import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smart_home/constant/text_constant.dart';
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
  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false ;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0 , right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only( right:15 ,top: 50, bottom: 32,),
                        child: Vectors(),
                      ),
                      ConstText(),
                    ],
                  ),
                  const Text("Sign Up" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                  const Text("Looks like you don’t have an account. Let’s create a new account for you." , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: TextFormFieldSherd(
                        text: "Email",
                      passwordVisible: false,
                      validat: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( bottom: 24),
                    child: TextFormFieldSherd(
                        text: "Password",
                      passwordVisible: true,
                      suffix:  Icon( passwordVisible ? Icons.visibility
                                                     : Icons.visibility_off,
            ),
                      // obscureText: true,
                    validat: MultiValidator([

                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                          "Password should not be greater than 15 characters")
                    ]),
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed:() {
                        if (_formKey.currentState!.validate()) {
                          print('the validate is ok') ;
                        }
                      },
                      elevation: 0,
                      height: 40,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:  Text("LOGIN" ,style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      color: Colors.green[300],
                      //child: const Color.fromARGB(52, 244, 161, 1),

                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top:20),
                    child: DividerWidget(),
                  ),
                  GoogleBottons(),
                  FacebookBottons(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextField(
                      onTap: (){},
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: "Continue as a guest",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )

                      ),
                    ),
                  ),

                ],

              ),
            );
          },
        ),
      ),
    );
  }
}




