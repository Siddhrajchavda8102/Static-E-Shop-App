import 'package:flutter/material.dart';

import '../objects/OrderModel.dart';

List<OrderModel> orderData = [
  OrderModel(
      image: "assets/images/login_bg2.jpg",
      title: "Plain T-shirt",
      date: "13 oct 2022",
      elvButton: "Placed",
      txtButton1: "Cancel"),
  OrderModel(
    image: "assets/images/register_bg2.jpg",
    title: "Denim jeans",
    date: "13 oct 2022",
    elvButton: "Transit",
    txtButton1: "track",
    txtButton2: TextButton(
        onPressed: () {},
        child: const Text("Cancel",
            style: TextStyle(fontSize: 13, color: Colors.orangeAccent))),
  ),
  OrderModel(
    image: "assets/images/register_bg2.jpg",
    title: "Summer Hat",
    date: "11 oct 2022",
    elvButton: "Delivered",
    txtButton1: "Exchange",
  ),
  OrderModel(
      image: "assets/images/register_bg.jpg",
      title: "Cotton Shirt",
      date: "12 oct 2022",
      elvButton: "Placed",
      txtButton1: "cancel"),
  OrderModel(
    image: "assets/images/forgotpassword_bg.jpg",
    title: "Full Top",
    date: "13 oct 2022",
    elvButton: "Transit",
    txtButton1: "track",
    txtButton2: TextButton(
      onPressed: () {},
      child: Text(
        "Cancel",
        style: TextStyle(fontSize: 13, color: Colors.orangeAccent),
      ),
    ),
  ),
  OrderModel(
    image: "assets/images/login_bg2.jpg",
    title: "Google Shades",
    date: "11 oct 2022",
    elvButton: "Delivered",
    txtButton1: "Exchange",
  ),
];
