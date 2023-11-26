import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:smart_home/constant/text_constant.dart';
import 'package:smart_home/widget/bottons.dart';
import 'package:smart_home/widget/vecters.dart';

import '../widget/divider_widget.dart';
import '../widget/text_form_field.dart';

class CreateNewAcount extends StatelessWidget {
  CreateNewAcount({super.key});
  final _formKey = GlobalKey<FormState>();
  RegExp regexPass=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp regexEmail =RegExp(r'^(?=.*?[A-Z])');
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
                    padding: const EdgeInsets.only(top: 24, ),
                    child: TextFormFieldSherd(
                      text: "Name",
                      passwordVisible: false,
                      validat: (value) {
                        if ( value!.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: TextFormFieldSherd(
                      text: "Email",
                      passwordVisible: false,
                      // obscureText: false,
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
                      validat: (value) {
                        if ( value!.isEmpty ) {
                          return 'Password is required';
                        }
                        else if(value.length < 6){
                          return ("Password Must be more than 5 characters");
                        }
                        else if(!regexPass.hasMatch(value)){
                          return ("Password should contain upper,lower,digit and Special character");
                        }else if (value.length > 15) {
                          return "Password should not be greater than 15 characters";
                        }
                        return null;
                      },
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
                      child:  Text("Create Acount" ,style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      color: Colors.green[300],
                      //child: const Color.fromARGB(52, 244, 161, 1),

                    ),
                  ),
                  // BottonsShered(text: 'LOGIN', onTap: (String? ) {  }, ),
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




