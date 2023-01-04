import '../objects/CatalogModel.dart';

List<CatalogModel> catalogdata = [
  CatalogModel(
      image: "assets/images/men_catalog.jpg",
      title: "Men",
      productCount: "204 products"),
  CatalogModel(
      image: "assets/images/women_catalog.jpg",
      title: "Women",
      productCount: "401 products"),
  CatalogModel(
      image: "assets/images/kids_catalog.jpg",
      title: "Kids",
      productCount: "173 products")
];

Map<String, CatalogModel> catalogdatamap = {
  "men": CatalogModel(
      image: "assets/images/men_catalog.jpg",
      title: "Men",
      productCount: "204 products"),
  "women" : CatalogModel(
      image: "assets/images/women_catalog.jpg",
      title: "Women",
      productCount: "401 products"),
  "kids" : CatalogModel(
      image: "assets/images/kids_catalog.jpg",
      title: "Kids",
      productCount: "173 products")
};
