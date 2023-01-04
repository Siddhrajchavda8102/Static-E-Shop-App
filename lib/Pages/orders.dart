// ignore_for_file: prefer_const_constructors

import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/Pages/orderDetail.dart';
import 'package:flutter/material.dart';

import '../data/orderData.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Widget> OrderList() {
    List<Widget> orderTile = [];

    for (int i = 0; i < orderData.length; i++) {
      orderTile.add(Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetailPage()));
            },
            child: OrderListTile(
              image: orderData[i].image,
              title: orderData[i].title,
              date: orderData[i].date,
              eleButton: orderData[i].elvButton,
              txtButton: orderData[i].txtButton1,
              textButton: orderData[i].txtButton2,
            ),
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ));
    }
    return orderTile;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(pageTitle: "Orders"),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.grey,
              elevation: 2.0,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: OrderList(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class OrderListTile extends StatelessWidget {
  OrderListTile({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.eleButton,
    required this.txtButton,
    this.textButton,
  }) : super(key: key);

  final String image;
  final String title;
  final String date;
  final String eleButton;
  final String txtButton;

  TextButton? textButton; //it is not required.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      //color: Colors.green,
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 95,
            // color: Colors.amber,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            height: 100,
            //color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 13),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(65, 30),
                            backgroundColor: Colors.orangeAccent),
                        child: Text(
                          eleButton,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: SizedBox(
                        height: 35,
                        width: 75,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            txtButton,
                            style: TextStyle(
                                fontSize: 13, color: Colors.orangeAccent),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(height: 30, width: 60, child: textButton),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
