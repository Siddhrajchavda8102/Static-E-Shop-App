// ignore_for_file: prefer_const_constructors

import 'package:e_shop/CommonWidgets/CommonTextButton.dart';
import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/InitialScreens/loginScreen.dart';
import 'package:e_shop/InitialScreens/mobileNumberRegister.dart';
import 'package:flutter/material.dart';

import '../CommonWidgets/LargeButton.dart';
import '../Pages/dashboard.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/register_bg2.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonTextField(labelText: "Enter Name"),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(labelText: "Enter Email"),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(labelText: "Enter Mobile Number"),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextField(labelText: "Enter Password"),
                        SizedBox(
                          height: 10,
                        ),
                        LargeButton(
                          text: "Register",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DashBoard()));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextButton(
                            text: "Already have an account? Login",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        CommonTextButton(
                            text: "Login with mobile number",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MobileNoRegister()));
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
