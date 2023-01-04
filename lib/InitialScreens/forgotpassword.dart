// ignore_for_file: prefer_const_constructors


import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/Constants/style.dart';
import 'package:e_shop/InitialScreens/loginScreen.dart';
import 'package:e_shop/InitialScreens/register.dart';
import 'package:e_shop/InitialScreens/resetPassword.dart';
import 'package:flutter/material.dart';


import '../CommonWidgets/LargeButton.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/forgotpassword_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              //color: Colors.amber,
              child: Text(
                "Forgot",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.amber,
              child: Text(
                "password?",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                //color: Colors.blue,
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonTextField(labelText: "Enter Email"),
                    CommonTextField(labelText: "Enter Mobile Number"),
                    LargeButton(
                      text: "Reset Password",
                      onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ResetPassword()));
                            },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Login",
                            style: sTextButton,
                          ),
                        ),
                        Text(
                          "|",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ));
                          },
                          child: Text(
                            "Register",
                            style: sTextButton,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
