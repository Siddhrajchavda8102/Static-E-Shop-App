import 'dart:convert';

import 'package:e_shop/Pages/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductList {
  final List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(Map<String, dynamic> parsedJson) {
    List<Product> products = [];

    List<dynamic> data = parsedJson["products"];

    products = data.map((i) => Product.fromJson(i)).toList();

    return ProductList(products: products);
  }
}

Future<ProductList> fetchAllProduct() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    print(response.body);
    return ProductList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}

class Product {
  final int id;
  final String image;
  final String title;
  final double discountPercentage;
  final double rating;
  final int price;
  final String brand;
  final String category;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.discountPercentage,
    required this.rating,
    required this.price,
    required this.brand,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        image: json['thumbnail'],
        title: json['title'],
        discountPercentage: json['discountPercentage'],
        rating: double.parse(json['rating'].toString()),
        price: json['price'],
        brand: json['brand'],
        category: json['category']);
  }
}

class MultiProductList extends StatefulWidget {
  const MultiProductList({super.key});

  @override
  State<MultiProductList> createState() => _MultiProductListState();
}

class _MultiProductListState extends State<MultiProductList> {
  late ProductList productList;
  //late Future<Product> product;
  late List<Product> data;
  List<Widget> displayProducts = [];

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    loadApi();
  }

  loadApi() async {
    productList = await fetchAllProduct();
    data = productList.products;

    // print(data.length);

    for (int i = 0; i < data.length; i++) {
      displayProducts.add(GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        product: data[i],
                      )));
        },
        child: Card(
          shadowColor: Colors.grey,
          elevation: 2.0,
          child: Container(
              //color: Colors.green,
              padding: EdgeInsets.all(10),
              height: 300,
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            //color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(data[i].image),
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
                            "${data[i].discountPercentage} Off",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        data[i].title,
                        maxLines: 2,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data[i].brand,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Text(data[i].rating.toString()),
                              const Icon(
                                Icons.star_border,
                                size: 18,
                              )
                            ],
                          ),
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "₹ " + "" + data[i].price.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ));
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Wrap(
            spacing: 10.0,
            runSpacing: 5.0,
            children: displayProducts,
          );
  }
}
