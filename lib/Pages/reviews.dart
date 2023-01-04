// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/data/reviewData.dart';
import 'package:flutter/material.dart';

List<Widget> displayReviewTile() {
  List<Widget> reviewTileList = [];

  for (int i = 0; i < reviewData.length; i++) {
    reviewTileList.add(Column(
      children: [
        ReviewsTile(
            image: reviewData[i].image,
            name: reviewData[i].name,
            time: reviewData[i].time,
            ratings: reviewData[i].ratings,
            description: reviewData[i].description),
        Divider(
          height: 1.0,
          color: Colors.grey,
        )
      ],
    ));
  }
  return reviewTileList;
}

List<Widget> filledStars(int ratings) {
  List<Widget> stars = [];
  List<Widget> blankstarList = [];

  int emptyStars = 5 - ratings;

  for (int i = 1; i <= ratings; i++) {
    stars.add(
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow,
      ),
    );
  }
 
  for (int j = 1; j <= emptyStars; j++) {
    blankstarList.add(Icon(
      Icons.star_border_sharp,
      size: 20,
    ));
  }
  //return stars;
  return [...stars, ...blankstarList];
}

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(pageTitle: "Reviews"),
            Card(
              clipBehavior: Clip.hardEdge,
              elevation: 3.0,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
               // height: 500,
                child: Column(
                  children: displayReviewTile(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ReviewsTile extends StatelessWidget {
  const ReviewsTile({
    required this.image,
    required this.name,
    required this.time,
    required this.ratings,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String image;
  final String name;
  final String time;
  final int ratings;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
      height: 150,
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Expanded(
                  child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      // color: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            time,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      //color: Colors.green,
                      child: Row(children: filledStars(ratings)),
                    )
                  ],
                ),
              ))
            ],
          ),
          Container(
           
            width: double.infinity,
            //color: Colors.cyan,
            margin: EdgeInsets.only(left: 65),
            child: Text(description,
                maxLines: 3,
                style: TextStyle(
                    height: 1.5,
                    wordSpacing: 0,
                    fontSize: 15,
                    color: Colors.grey[800])),
          )
        ],
      ),
    );
  }
}
