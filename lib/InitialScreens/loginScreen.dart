import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/CommonTextButton.dart';
import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:e_shop/Pages/dashboard.dart';
import 'package:e_shop/InitialScreens/forgotpassword.dart';
import 'package:e_shop/InitialScreens/mobileNumberRegister.dart';
import 'package:e_shop/InitialScreens/register.dart';

import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: AppBgImage(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             //  color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "SignIn",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      // constraints: BoxConstraints(maxWidth: 400),
                      height: 500,
                      //color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonTextField(
                            labelText: "Enter Email",
                          ),
                          CommonTextField(
                            labelText: "Enter Password",
                          ),
                          LargeButton(
                            text: "Login",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DashBoard()));
                            },
                          ),
                          CommonTextButton(
                              text: "Register with email",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Register(),
                                    ));
                              }),
      
                          CommonTextButton(
                              text: "Register With Mobile Number",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MobileNoRegister()));
                              }),
                          CommonTextButton(
                              text: "Forgot Password",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
