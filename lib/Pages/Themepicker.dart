import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Services/ThemeProvider/ThemeProvider.dart';
import '../data/themes.dart';

class Themepicker extends StatefulWidget {
  const Themepicker({super.key});

  @override
  State<Themepicker> createState() => _ThemepickerState();
}

class _ThemepickerState extends State<Themepicker> {
  //List<Widget> colorBoxList = [];
  String selected = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  onTapBox(String c) {
    print(c);
    setState(() {
      selected = c;
    });
  }

  List<Widget> boxes() {
    List<Widget> list = [];

    themes.forEach((c, value) {
      list.add(
        ThemeColorBox(
        color: c, //themes[key]!,
        onTap: onTapBox,
        isSelected: selected == c ? true : false,
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    //  color: Colors.green,
      child: Wrap(
        spacing: 6,
        children: boxes(), //colorBoxList,
      ),
    );
  }
}

class ThemeColorBox extends StatelessWidget {
  const ThemeColorBox({
    Key? key,
    required this.isSelected,
    required this.color,
    this.padding,
    required this.onTap,
  }) : super(key: key);

  final String color;
  final EdgeInsets? padding;
  final Function(String a) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, child) {
      return GestureDetector(
        onTap: () {
          notifier.changeTheme(color);
          onTap(color);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              child: Padding(
                padding: padding ?? EdgeInsets.all(5),
                child: Container(
                  height: 30,
                  width: 30,
                  color: themes[color],
                ),
              ),
            ),
            isSelected ? const Icon(Icons.check, color: Colors.white,) : SizedBox(),
          ],
        ),
      );
    });
  }
}
