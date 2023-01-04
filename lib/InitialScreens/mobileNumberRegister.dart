import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:e_shop/Constants/style.dart';
import 'package:e_shop/InitialScreens/loginScreen.dart';

import 'package:e_shop/InitialScreens/register.dart';
import 'package:flutter/material.dart';


class MobileNoRegister extends StatefulWidget {
  const MobileNoRegister({super.key});

  @override
  State<MobileNoRegister> createState() => _MobileNoRegisterState();
}

class _MobileNoRegisterState extends State<MobileNoRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/register_bg.jpg"),
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
                  "Enter mobile",
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
                  "number",
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
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonTextField(labelText: "Enter Mobile Number"),
                      LargeButton(
                        text: "Get OTP",
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const GetOtp()));
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
