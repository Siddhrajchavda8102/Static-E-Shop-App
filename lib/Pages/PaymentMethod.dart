import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/Pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PageHeader(pageTitle: "Payment Method"),
              Card(
                elevation: 3.0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: deviceWidth,
                          child: Text(
                            "Select Payment Method",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      Container(
                        //  color: Colors.grey,
                        height: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: const [
                            PaymentMethodBox(
                              text: "GPay",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            PaymentMethodBox(
                              text: "Paypal",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            PaymentMethodBox(
                              text: "UPI",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            PaymentMethodBox(
                              text: "Visa",
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Add Card",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.grey[800]),
                        ),
                      ),
                      CommonTextField(
                        labelText: "Card Holder Name",
                        fillColor: Colors.grey.shade300,
                      ),
                      CommonTextField(
                        labelText: "Card Number",
                        fillColor: Colors.grey.shade300,
                      ),
                      Container(
                        //color: Colors.amber,
                        height: 80,
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      border: InputBorder.none,
                                      labelText: "Expiry Date",
                                      fillColor: Colors.grey[300],
                                      contentPadding:
                                          const EdgeInsets.all(10))),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Flexible(
                              child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      border: InputBorder.none,
                                      labelText: "Security Code",
                                      fillColor: Colors.grey[300],
                                      contentPadding:
                                          const EdgeInsets.all(10))),
                            ),
                          ],
                        ),
                      ),
                      LargeButton(
                        text: "Pay Now",
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Payment Successfully",
                              backgroundColor: Colors.blue,
                              gravity: ToastGravity.BOTTOM);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashBoard()));
                        },
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

class PaymentMethodBox extends StatelessWidget {
  const PaymentMethodBox({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        //color: Colors.amber,
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
