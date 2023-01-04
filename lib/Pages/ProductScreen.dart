import 'package:e_shop/Pages/MultiProductList.dart';
import 'package:flutter/material.dart';

import '../CommonWidgets/AppScaffold.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            PageHeader(
              pageTitle: "Products",
              menu: false,
            ),
            MultiProductList(),
          ],
        ),
      ),
    ));
  }
}
