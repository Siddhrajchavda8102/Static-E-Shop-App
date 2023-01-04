// ignore_for_file: prefer_const_constructors

import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/InitialScreens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Services/ThemeProvider/ThemeProvider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
            builder: (context, ThemeProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Shop',
            theme: ThemeData(
                brightness: notifier.buildBrightness(),
                primarySwatch: Colors.blue,
                sliderTheme: SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                ),
                textTheme:
                    TextTheme(headline5: TextStyle(color: Colors.green))),
            home: AppHome(
                child: AppHome(
              child: LoginScreen(),
            )),
          );
        }));
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return child;
  }
}
