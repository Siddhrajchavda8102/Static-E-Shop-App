// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/data/messagesData.dart';
import 'package:flutter/material.dart';
import '../Constants/constants.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<Widget> displayMessage() {
    List<Widget> messageTile = [];

    for (int i = 0; i < messagesData.length; i++) {
      messageTile.add(
        Column(
          children: [
            MessageListTile(
                image: messagesData[i].image,
                title: messagesData[i].title,
                subTitle: messagesData[i].subTitle,
                time: messagesData[i].time,
                badge: messagesData[i].badge),
            Divider(
              color: Colors.grey,
              height: 1.0,
            )
          ],
        ),
      );
    }
    return messageTile;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(pageTitle: "Messages"),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadowColor: Colors.grey,
              elevation: 2.0,
              child: Container(
                //height: 600,
                child: Column(
                  children: displayMessage(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class MessageListTile extends StatelessWidget {
  MessageListTile(
      {Key? key,
      //required this.icon,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.time,
      required this.badge})
      : super(key: key);

  // final IconData icon;
  final String image;
  final String title;
  final String subTitle;
  final String time;
  final String badge;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        //color: Colors.amber,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        alignment: Alignment.center,
        // color: Colors.green,
        height: 90,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              shadowColor: Colors.grey,
              elevation: 1.0,
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow[800],
                      borderRadius: BorderRadius.circular(5)),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  )),
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      height: 50,
                      width: deviceWidth! - 150,
                      //color: Colors.blueGrey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        //  Text(constraints.maxWidth.toString()),
                          Text(
                            title,
                            //"New Message for you",
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                          Expanded(
                            child: Text(
                              subTitle,
                              //"Its useless to worry about thing that already happened and cannot be changed",
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        // color: Colors.greenAccent,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              time,
                              style: TextStyle(fontSize: 13),
                            ),
                            badge != ""
                                ? Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 20,
                                    //padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.amber[600],
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Text(
                                      badge!,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
