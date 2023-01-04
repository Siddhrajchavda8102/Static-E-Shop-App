// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/Pages/MultiProductList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../CommonWidgets/AppScaffold.dart';
import '../Services/ThemeProvider/ThemeProvider.dart';
import 'Themepicker.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final _ratingController;
  late double _rating;

  double _initialRating = 2.0;

  List<Widget> colorBoxList = [];

  

  @override
  void initState() {
    super.initState();

    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: _scaffoldKey,
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(
                scaffoldKey: _scaffoldKey,
                pageTitle: "Top Deals",
                menu: true,
              ),
              MultiProductList(),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  // color: Colors.green,
                  padding: EdgeInsets.all(20),
                  height: 200,
                  width: deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Light Or Dark Mode",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "This app comes can be used in light and dark mode as per your requirements",
                          textAlign: TextAlign.center,
                          // style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Container(
                        //color: Colors.amber,
                        height: 50,
                        width: double.infinity,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Consumer<ThemeProvider>(
                              builder: (context, notifier, child) =>
                                  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[400]),
                                onPressed: () {
                                  notifier.changeBrightness("light");
                                },
                                child: Text("Light Mode"),
                              ),
                            ),
                            Consumer<ThemeProvider>(
                              builder: (context, notifier, child) =>
                                  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[600]),
                                onPressed: () {
                                  notifier.changeBrightness("dark");
                                },
                                child: Text("Dark Mode"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 10.0,
                clipBehavior: Clip.hardEdge,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Pick Your Theme",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "This app is configured to use various themes.  Pick any theme of your choice",
                          textAlign: TextAlign.center,
                          // style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Container(
                        //  color: Colors.amber,
                        // height: 50,
                        width: deviceWidth,
                        child: Center(
                          child: Themepicker(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                shadowColor: Colors.grey,
                elevation: 2.0,
                child: Container(
                  height: 400,
                  width: deviceWidth,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                        child: Container(
                          // color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vendors",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.blueGrey,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                VendorList(
                                  initialRating: _initialRating,
                                  image: "assets/images/forgotpassword_bg.jpg",
                                  name: "Hatti Key",
                                  brand: "XCross Solutions",
                                  onRatingUpdate: (ratings) {
                                    setState(() {
                                      _rating = ratings;
                                    });
                                  },
                                ),
                                VendorList(
                                  initialRating: _initialRating,
                                  image: "assets/images/login_bg2.jpg",
                                  name: "Barton maggie",
                                  brand: "Rempage Solutions",
                                  onRatingUpdate: (ratings) {
                                    setState(() {
                                      _rating = ratings;
                                    });
                                  },
                                ),
                                VendorList(
                                  initialRating: _initialRating,
                                  image: "assets/images/men_catalog.jpg",
                                  name: "Alpesh",
                                  brand: "It Solutions",
                                  onRatingUpdate: (ratings) {
                                    setState(() {
                                      _rating = ratings;
                                    });
                                  },
                                ),
                              
                              ],
                            ),
                          ),
                        ),
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

class VendorList extends StatelessWidget {
  const VendorList({
    Key? key,
    required double initialRating,
    required this.onRatingUpdate,
    required this.image,
    required this.name,
    required this.brand,
  })  : _initialRating = initialRating,
        super(key: key);

  final double _initialRating;
  final void Function(double) onRatingUpdate;
  final String image;
  final String name;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 180,
      //color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage(image))),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20, color: Colors.grey[800]),
          ),
          Text(
            brand,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Container(
            child: RatingBar.builder(
                initialRating: _initialRating,
                itemCount: 5,
                minRating: 1,
                unratedColor: Colors.grey[300],
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 20.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.grey[700],
                    ),
                onRatingUpdate: onRatingUpdate

                //  (rating) {
                //   // setState(() {
                //   //   _rating = rating;
                //   // });
                // }
                ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Shop"))
        ],
      ),
    );
  }
}
