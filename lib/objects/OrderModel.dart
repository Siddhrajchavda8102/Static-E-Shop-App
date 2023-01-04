import 'package:flutter/material.dart';

class OrderModel {
  final String image;
  final String title;
  final String date;
  final String elvButton;
  final String txtButton1;
  
   TextButton? txtButton2;

  OrderModel({
      required this.image,
      required this.title,
      required this.date,
      required this.elvButton,
      required this.txtButton1,
      this.txtButton2,
  });
}
