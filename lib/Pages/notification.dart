


import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:flutter/material.dart';



import '../data/notificationData.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Widget> displayNotification() {
    List<Widget> notificationTile = [];

    for (int i = 0; i < notificationData.length; i++) {
      notificationTile.add(Column(
        children: [
          NotificationListTile(
              icon: notificationData[i].icon,
              title: notificationData[i].title,
              subTitle: notificationData[i].subtitle,
              time: notificationData[i].time),
          
          const Divider(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ));
    }

    return notificationTile;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
             const PageHeader(pageTitle: "Notifications"),
            Card(
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey,
              elevation: 2.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: displayNotification(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.time,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subTitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        alignment: Alignment.center,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                    child: Icon(
                      icon,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  width: deviceWidth - 150,
                  // height: 50,
                  // width: Orientation == Orientation.portrait ? 200 : 550,
                  // color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          title,
                          
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
             
              height: 40,
              child: Text(
                time,
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      );
    });
  }
}
