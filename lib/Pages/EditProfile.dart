import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const PageHeader(pageTitle: "Edit Profile"),
          Card(
            elevation: 3.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: deviceWidth,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/images/women_catalog.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  CommonTextField(
                    labelText: "Enter Name",
                    fillColor: Colors.grey[300]!,
                  ),
                  CommonTextField(
                      labelText: "Date of Birth", fillColor: Colors.grey[300]!),
                  CommonTextField(
                      labelText: "Enter Mobile Number",
                      fillColor: Colors.grey[300]!),
                  CommonTextField(
                      labelText: "Enter Password",
                      obscureText: true,
                      fillColor: Colors.grey[300]!),
                  CommonTextField(
                      labelText: "Re-enter Password",
                      obscureText: true,
                      fillColor: Colors.grey[300]!),
                  CommonTextField(
                      labelText: "Enter Profession",
                      fillColor: Colors.grey[300]!),
                  CommonTextField(
                      labelText: "Enter Position",
                      fillColor: Colors.grey[300]!),
                  LargeButton(
                      text: "Save Changes",
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Save Changes Sucessfully",
                            backgroundColor: Colors.blue);
                      })
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }
}
