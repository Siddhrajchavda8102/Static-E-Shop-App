// ignore_for_file: prefer_const_constructors


import 'package:e_shop/CommonWidgets/AppScaffold.dart';
import 'package:e_shop/CommonWidgets/FAQ_Card.dart';
import 'package:e_shop/data/faqData.dart';
import 'package:flutter/material.dart';


class FrequentlyAskedQuestion extends StatefulWidget {
  const FrequentlyAskedQuestion({super.key});

  @override
  State<FrequentlyAskedQuestion> createState() =>
      _FrequentlyAskedQuestionState();
}

class _FrequentlyAskedQuestionState extends State<FrequentlyAskedQuestion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> FaqCardList() {
    List<Widget> FaqCardWidgets = [];

    for (int i = 0; i < faqData.length; i++) {
      FaqCardWidgets.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
        child:
            Faq_Card(queTitle: faqData[i].title, question: faqData[i].question),
      ));
    }
    return FaqCardWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
       
        child: AppBackground(
            child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(
                
                pageTitle: "Frequently Asked Questions",
                menu: false
                ,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: FaqCardList(),
              )
              
            ],
          ),
        )));
  }
}
