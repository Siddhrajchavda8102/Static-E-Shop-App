import 'dart:convert';

import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryList {
  final List<String> Categories;

  CategoryList({required this.Categories});

  factory CategoryList.fromJson(List<dynamic> json) {
    List<String> categories = [];

    for (int i = 0; i < json.length; i++) {
      categories.add(json[i]);
    }
    return CategoryList(Categories: categories);
  }
}

Future<CategoryList> fetchAllCategory() async {
  final response =
      await http.get(Uri.parse('https://dummyjson.com/products/categories'));

  if (response.statusCode == 200) {
    return CategoryList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load Categories");
  }
}

class MultiCategoryList extends StatefulWidget {
  const MultiCategoryList({super.key});

  @override
  State<MultiCategoryList> createState() => _MultiCategoryListState();
}

class _MultiCategoryListState extends State<MultiCategoryList> {
  late CategoryList categoryList;
  late List<String> data;
  List<Widget> displayCategories = [];
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
    categoryList = await fetchAllCategory();
    data = categoryList.Categories;
    print(data.length);

    for (int i = 0; i < data.length; i++) {
      displayCategories.add(
        Card(
          shadowColor: Colors.grey,
          elevation: 2.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 150,
              child: Text(
                data[i],
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(pageTitle: "Categories"),
              isLoading
                  ? const CircularProgressIndicator()
                  : Wrap(
                      spacing: 10.0,
                      runSpacing: 5.0,
                      children: displayCategories,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
