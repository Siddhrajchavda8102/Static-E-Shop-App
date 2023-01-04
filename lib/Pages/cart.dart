// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:e_shop/Pages/orderDetail.dart';
import 'package:e_shop/data/cartData.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Widget> CartList() {
    List<Widget> CartTile = [];

    for (int i = 0; i < cartdata.length; i++) {
      CartTile.add(Column(
        children: [
          CartListTile(
            image: cartdata[i].image,
            productName: cartdata[i].productName,
            brand: cartdata[i].brand,
            price: cartdata[i].price,
            size: cartdata[i].size,
            color: cartdata[i].color,
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          )
        ],
      ));
    }
    return CartTile;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(pageTitle: "Cart"),
            Card(
              shadowColor: Colors.grey[500],
              elevation: 2.0,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Container(
                //color: Colors.amber,
                width: double.infinity,
                child: Column(
                  children: CartList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: LargeButton(
                  text: "Confirm Order",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetailPage()));
                  }),
            )
          ],
        ),
      ),
    ));
  }
}

class CartListTile extends StatelessWidget {
  const CartListTile(
      {Key? key,
      required this.image,
      required this.productName,
      required this.brand,
      required this.price,
      required this.size,
      required this.color})
      : super(key: key);

  final String image;
  final String productName;
  final String brand;
  final String price;
  final String size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      //color: Colors.green,
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.fill),
                boxShadow: [
                  const BoxShadow(
                      color: Colors.white, blurRadius: 1.0, spreadRadius: 1.0)
                ]),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15.0),
              //color: Colors.blue,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    brand,
                    style: TextStyle(color: Colors.amber, fontSize: 13),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "₹" + price,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Text("-")),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                //color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Text("1")),
                        Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Text("+")),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        decoration:
                            BoxDecoration(color: color, shape: BoxShape.circle),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        height: 25,
                        width: 35,
                        child: Text(size),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
