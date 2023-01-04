// ignore_for_file: prefer_const_constructors


import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/data/settingsData.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Widget> SettingTiles() {
    List<Widget> settings = [];

    for (int i = 0; i < settingData.length; i++) {
      settings.add(Column(
        children: [
          SettingListTile(
            title: settingData[i].title,
            subString: settingData[i].subString,
            arrow: settingData[i].arrow,
            switchIcon: settingData[i].switchIcon,
          ),
          Divider(
            color: Colors.grey,
            height: 1.0,
          )
        ],
      ));
    }
    return settings;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: AppBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(pageTitle: "Settings"),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.grey,
              elevation: 2.0,
              child: Container(
                //height: 500,
                width: deviceWidth,
                child: Column(
                  children: SettingTiles(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile(
      {Key? key,
      required this.title,
      required this.subString,
      this.arrow = false,
      this.switchIcon = false})
      : super(key: key);

  final String title;
  final String subString;
  final bool? arrow;
  final bool? switchIcon;
   final bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: deviceWidth,
      height: 80,
      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //color: Colors.amber,
            child: Text(
              title,
              //"Manage Account",
              style: TextStyle(fontSize: 18),
            ),
          ),
          switchIcon == true
              ? Switch(
                  value: switchValue,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    
                  },
                )
              : Container(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: subString != ""
                              ? Text(
                                  subString,
                                  // "English",
                                  style: TextStyle(fontSize: 16),
                                )
                              : SizedBox()),
                      arrow == true
                          ? Container(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
