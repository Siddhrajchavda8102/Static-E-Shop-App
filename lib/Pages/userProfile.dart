// ignore_for_file: prefer_const_constructors

import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(pageTitle: "Customer Profile"),
              Card(
                shadowColor: Colors.grey,
                elevation: 2.0,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/women_catalog.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        "Emmi Derill",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      Text(
                        "Software Develpoer",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey[700]),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          // color: Colors.amber,
                          width: double.infinity,
                          child: Text(
                            "Someone I know recently combined  Maple Syrup & buttered Popcorn thinking it would taste.",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 18,
                                color: Colors.grey[700]),
                          )),
                      Container(
                        width: 200,
                        //color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  elevation: 5.0,
                                  minimumSize: Size(90, 40),
                                  backgroundColor: Colors.amber),
                              child: Text("chat"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  elevation: 5.0,
                                  minimumSize: Size(90, 40),
                                  backgroundColor: Colors.amber),
                              child: Text("Call"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
