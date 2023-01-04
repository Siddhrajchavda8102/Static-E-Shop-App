import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/Pages/MultiProductList.dart';
import 'package:e_shop/Pages/cart.dart';
import 'package:e_shop/Pages/reviews.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(pageTitle: "Product Details"),
              Card(
                shadowColor: Colors.grey,
                elevation: 2.0,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  // height: 700,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 320,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: NetworkImage(widget.product.image),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                widget.product.discountPercentage.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.favorite_outlined,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  Text("231")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            widget.product.title,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "ShopOn",
                              style: TextStyle(fontSize: 15),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Product Added To Cart",
                                      backgroundColor: Colors.blue);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CartScreen()));
                                },
                                child: Text("Add to cart"))
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "₹" + " " + widget.product.price.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        //color: Colors.amber,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              //color: Colors.blue,
                              height: 50,
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[600]!,
                                            width: 3.0),
                                        shape: BoxShape.circle,
                                        color: Colors.pink[500]),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue[500]),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green[500]),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // color: Colors.blue,
                              height: 40,
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 40,
                                    child: Text("M"),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 2.0),
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 40,
                                    child: Text("L"),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 40,
                                    child: Text("XL"),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        margin: EdgeInsets.only(top: 10),
                        //height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Design philosophies are usually for determining design goals.A design goal may range from solving the least significant  individual problem of the smallest element.to the most holistic influential utopian goals.",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(5),
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              //color: Colors.blue,
                              height: 50,
                              width: 50,
                              child: Text(
                                widget.product.rating.toString(),
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Container(
                            //   child: Column(),
                            // ),
                            Text(
                              "Write Reviews",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: displayReviewTile(),
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
