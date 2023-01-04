// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/data/catalogData.dart';
import 'package:flutter/material.dart';


class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  
   List<Widget> CatalogList() {
    List<Widget> catalogTile = [];


    catalogdatamap.forEach((key, value) {
      catalogTile.add(CatalogListItem(
          image: catalogdatamap[key]!.image,
          title: catalogdatamap[key]!.title,
          productsCount: catalogdatamap[key]!.productCount));
    });

    return catalogTile;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(pageTitle: "Catalog"),
              Column(
                children: CatalogList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogListItem extends StatelessWidget {
  const CatalogListItem({
    Key? key,
    required this.image,
    required this.title,
    required this.productsCount,
  }) : super(key: key);
  final String image;
  final String title;
  final String productsCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shadowColor: Colors.grey,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill)),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              productsCount,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
