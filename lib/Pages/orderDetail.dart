import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/Pages/PaymentMethod.dart';

import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
             const PageHeader(pageTitle: "Order Details"),
              Card(
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Address",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.grey[800]),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        // color: Colors.amber,
                        width: deviceWidth - 90,
                        child: Text(
                          "No. 102, First Floor, Techno Complex, Nr. Greater Studio, City Street New York, USA.",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                              height: 1.5),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Add address"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[500]),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 20),
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Summary",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.grey[800]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          Text(
                            "₹" + "50.0",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fees",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          Text(
                            "₹" + "05.0",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discont",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          Text(
                            "-" + "₹" + "15.0",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          Text(
                            "₹" + "40.0",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[850]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LargeButton(
                  text: "Checkout",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentMethod()));
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
