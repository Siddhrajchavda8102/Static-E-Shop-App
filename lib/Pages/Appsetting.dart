import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/Services/ThemeProvider/ThemeProvider.dart';
import 'package:e_shop/data/LanguageData.dart';
import 'package:e_shop/data/themes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  // List<Widget> displayAppColor() {
  //   List<Widget> themeContainer = [];

  //   themes.forEach((key, value) {
  //     themeContainer.add(AppColorCard(color: themes[key]));
  //   });
  //   return themeContainer;
  // }

  String selected = "";

  onTap(String c) {
    setState(() {
      selected = c;
    });
  }

  List<Widget> displayAppColor() {
    List<Widget> themeContainer = [];

    themes.forEach((key, value) {
      themeContainer.add(AppColorCard(
        color: key,
        onTap: onTap,
        isSelected: selected == key ? true : false,
      ));
    });
    return themeContainer;
  }

  List<Widget> displayLanguageCard() {
    List<Widget> languageCardList = [];

    for (int i = 0; i < languageData.length; i++) {
      languageCardList.add(CardLanguage(
          image: languageData[i].image, name: languageData[i].name));
    }
    return languageCardList;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        alignment: Alignment.centerLeft,
        //color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "App Theme Mode",
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Consumer(builder: (BuildContext context,
                        ThemeProvider notifier, Widget? child) {
                      return GestureDetector(
                        onTap: () {
                          notifier.changeBrightness("light");
                          
                        },
                        child: CardContainer(
                          color: Colors.grey[350],
                          isSelected: true,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 50,
                      width: 10,
                    ),
                    Consumer(builder: (BuildContext context,
                        ThemeProvider notifier, Widget? child) {
                      return GestureDetector(
                        onTap: () {
                          notifier.changeBrightness("dark");
                        },
                        child: CardContainer(
                          color: Colors.grey[700],
                          isSelected: true,
                        ),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: 15,
                width: deviceWidth,
              ),
              Container(
                width: deviceWidth,
                child: const Text(
                  "App Color",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
              ),
              SizedBox(
                height: 15,
                width: deviceWidth,
              ),
              Container(
                //color: Colors.brown,
                width: deviceWidth,
                // height: 200,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 3.0,
                  runSpacing: 3.0,
                  children: displayAppColor(),
                ),
              ),
              SizedBox(
                height: 15,
                width: deviceWidth,
              ),
              Container(
                width: deviceWidth,
                child: const Text(
                  "App Language",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
              ),
              SizedBox(
                height: 15,
                width: deviceWidth,
              ),
              Container(
                // height: 900,
                //color: Colors.green,
                width: deviceWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: displayLanguageCard(),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}



class CardLanguage extends StatelessWidget {
  const CardLanguage({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Container(
        height: 70,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(5)),
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                image,
              ),
            ),
            Text(
              name,
              style: TextStyle(color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, this.color, required this.isSelected})
      : super(key: key);
  final Color? color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        elevation: 3.0,
        color: color,
        child: Container(
          height: 70,
          width: 70,
        ),
      ),
      
    ]);
  }
}

class AppColorCard extends StatelessWidget {
  const AppColorCard({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });
  final String color;

  // final String color;

  final Function(String c) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider notifier, child) {
      return GestureDetector(
        onTap: () {
          notifier.changeTheme(color);
          onTap(color);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              elevation: 3.0,
              color: themes[color],
              child: Container(
                height: 70,
                width: 70,
              ),
            ),
            isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  )
                : const SizedBox()
          ],
        ),
      );
    });
  }
}
