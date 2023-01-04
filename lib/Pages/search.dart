import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/CommonTextField.dart';
import 'package:e_shop/CommonWidgets/LargeButton.dart';
import 'package:flutter/material.dart';

List<String> gender = <String>["Men", "Women", "Kids"];
List<String> category = <String>[
  "Fashion",
  "Business",
  "Electronics",
  "Mobile",
  "Fitness",
  "Decor",
  "Stationary"
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //List<String> gender = <String>["Men", "Women", "Kids"];
  String initialValue = gender.first;
  String initValueCat = category.first;

  List<Color> colors = [
    Colors.cyan,
    Colors.blue.shade400,
    Colors.yellow.shade600,
    Colors.green,
    Colors.grey.shade600,
    Colors.lime,
    Colors.brown,
    Colors.pink.shade400,
    Colors.brown,
    Colors.purple
  ];

  List<String> sizes = ["XS", "S", "M", "L", "Xl", "XXl"];

  List<Widget> pickSize() {
    List<Widget> pickSizeCon = [];

    for (int i = 0; i < sizes.length; i++) {
      pickSizeCon.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: 25,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: i == 0
                  ? Border.all(color: Colors.black, width: 1.5)
                  : Border.all(color: Colors.white)),
          child: Text(sizes[i]),
        ),
      ));
    }
    return pickSizeCon;
  }

  // List<Widget> pickColorContainer = PickColor();

  List<Widget> PickColor() {
    List<Widget> pickColorcon = [];

    for (int i = 0; i < colors.length; i++) {
      pickColorcon.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: i == 0
                  ? Border.all(color: Colors.black, width: 1.5)
                  : Border.all(color: colors[i]),
              color: colors[i],
              shape: BoxShape.circle),
        ),
      ));
    }
    return pickColorcon;
  }

  RangeValues _currentRangeValues = const RangeValues(100, 505);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(pageTitle: "Search"),
              Card(
                // margin: EdgeInsets.symmetric(vertical: 20),
                shadowColor: Colors.grey,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 700,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonTextField(
                        labelText: "Enter Search",
                        fillColor: Colors.grey.shade300,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        //height: 50,
                        width: double.infinity,

                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Container(
                              //color: Colors.amber,
                              width: double.infinity,
                              child: DropdownButton(
                                style: TextStyle(color: Colors.black),
                                isExpanded: true,
                                value: initialValue,
                                items: gender
                                    .map((String item) => DropdownMenuItem(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: ((String? newValue) => setState(() {
                                      initialValue = newValue!;
                                    })),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        //height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Container(
                              //color: Colors.amber,
                              width: double.infinity,
                              child: DropdownButton(
                                style: TextStyle(color: Colors.black),
                                isExpanded: true,
                                value: initValueCat,
                                items: category
                                    .map((String items) => DropdownMenuItem(
                                        value: items, child: Text(items)))
                                    .toList(),
                                onChanged: ((String? newValue) => setState(() {
                                      initValueCat = newValue!;
                                    })),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        //height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price Range",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            RangeSlider(
                              values: _currentRangeValues,
                              max: 900,
                              min: 0,
                              // divisions: 10,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pick Colors"),
                            Wrap(
                                direction: Axis.horizontal,
                                children: PickColor())
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pick Sizes"),
                            Wrap(
                                direction: Axis.horizontal,
                                children: pickSize())
                          ],
                        ),
                      ),
                      LargeButton(
                          color: Colors.yellow[700],
                          text: "Search",
                          onPressed: () {})
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
