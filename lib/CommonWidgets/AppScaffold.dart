import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/Pages/Appsetting.dart';
import 'package:e_shop/Pages/cart.dart';
import 'package:e_shop/Pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/ThemeProvider/ThemeProvider.dart';
import '../data/themes.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.scaffoldKey,
  });

  final Widget child;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const MyDrawer(),
          endDrawer: AppSetting(),
          body: child,
        );
      }),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.pageTitle,
    this.menu,
    this.scaffoldKey,
  });

  final String pageTitle;
  final bool? menu;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      height: 110,
      child: Column(
        children: [
          Container(
            //color: Colors.amber,
            width: deviceWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menu == true
                    ? IconButton(
                        onPressed: () {
                          if (scaffoldKey != null)
                            scaffoldKey!.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          // color: Colors.white,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.blueGrey[800],
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.blueGrey[800],
                        ),
                      ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.blueGrey[800],
                          )),
                      IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Icon(
                            Icons.settings,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.blueGrey[800],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              pageTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBgImage extends StatelessWidget {
  const AppBgImage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_bg2.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        child
      ],
    );
  }
}

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<ThemeProvider>(
            builder: (context, ThemeProvider notifier, child1) {
          String getTheme = notifier.buildTheme();

          Color c = themes[getTheme]!;

          return Container(
            height: 300,
            color: c,
          );
        }),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: child,
        )
      ],
    );
  }
}
