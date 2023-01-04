import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/Constants/style.dart';
import 'package:e_shop/InitialScreens/loginScreen.dart';
import 'package:e_shop/InitialScreens/register.dart';
import 'package:flutter/material.dart';

import '../CommonWidgets/LargeButton.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/forgotpassword_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                //color: Colors.amber,
                child: const Text(
                  "Reset",
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
                child: const Text(
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  //color: Colors.blue,
                  height: 400,
                  width: deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Image.asset(
                        'assets/images/login_bg2.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )),
                      Text(
                        "Hello Sid Chavda",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.bold),
                      ),
                      CommonTextField(labelText: "Enter Password",obscureText: true,),
                      CommonTextField(labelText: "Re-enter Password",obscureText: true,),
                      LargeButton(
                        text: "Save Password",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
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
                          const Text(
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
          ),
        )
      ],
    ));
  }
}
