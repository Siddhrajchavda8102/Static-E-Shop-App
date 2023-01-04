import 'package:flutter/material.dart';


import '../Constants/constants.dart';

// ignore: camel_case_types
class Faq_Card extends StatelessWidget {
  const Faq_Card({super.key, required this.queTitle, required this.question});

  final String queTitle;
  final List<String> question;

  List<Widget> tile() {
    List<Widget> multitile = [];

    for (int i = 0; i < question.length; i++) {
      multitile.add(Column(
        children: [
          Account_FAQ_Tile(question: question[i]),
           const Divider(
            color: Colors.grey,
            height: 1.0,
          )
        ],
      ));
    }
    return multitile;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      shadowColor: Colors.grey,
      elevation: 2.0,
      child: Container(
        // color: Colors.blue,

        //height: 600,
        width: deviceWidth,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              alignment: Alignment.centerLeft,
              //color: Colors.green,
              height: 50,
              width: deviceWidth,
              child: Text(
                queTitle,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: tile(),
            )
            // Account_FAQ_Tile(
            //   question: question
            // ),
            // Divider(color: Colors.grey, height: 1.0),
            // Account_FAQ_Tile(
            //   question: question,
            // )
          ],
        ),
      ),
    );
  }
}

class Account_FAQ_Tile extends StatelessWidget {
  const Account_FAQ_Tile({Key? key, required this.question}) : super(key: key);
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(9, 3, 0, 8),
      // color: Colors.amber,
      // height: 60,
      width: deviceWidth,
      child: Row(
        children: [
          const Icon(
            Icons.help_outline,
            size: 20,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //color: Colors.amber,//dont give this color.
                    child: Expanded(
                      child: Text(
                        question,
                        maxLines: 3,
                        //textAlign: TextAlign.justify,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                           // backgroundColor: Colors.amber,
                            fontSize: 17,
                            color: Colors.grey[800],
                            height: 1.5),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(left: 8),
                    child: Icon(Icons.navigate_next),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
