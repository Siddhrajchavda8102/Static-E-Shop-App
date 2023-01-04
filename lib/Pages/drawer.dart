// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:e_shop/Constants/constants.dart';
import 'package:e_shop/InitialScreens/loginScreen.dart';
import 'package:e_shop/Pages/EditProfile.dart';
import 'package:e_shop/Pages/MultiCategoryList.dart';
import 'package:e_shop/Pages/cart.dart';
import 'package:e_shop/Pages/dashboard.dart';
import 'package:e_shop/InitialScreens/forgotpassword.dart';
import 'package:e_shop/Pages/frequnentlyAskedQue.dart';
import 'package:e_shop/Pages/messages.dart';
import 'package:e_shop/Pages/notification.dart';
import 'package:e_shop/Pages/orders.dart';
import 'package:e_shop/InitialScreens/register.dart';
import 'package:e_shop/InitialScreens/resetPassword.dart';
import 'package:e_shop/Pages/reviews.dart';
import 'package:e_shop/Pages/search.dart';
import 'package:e_shop/Pages/settings.dart';
import 'package:e_shop/Pages/userProfile.dart';
import 'package:flutter/material.dart';

import 'ProductScreen.dart';
import 'catalog.dart';
import '../InitialScreens/mobileNumberRegister.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: deviceWidth,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: deviceWidth,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.amber,
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/women_catalog.jpg"),
                                    
                                fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Siddhraj Chavda",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Software Developer",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      Card(
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                            margin: EdgeInsets.only(top: 30),
                            //height: 600,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 1.0,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Column(
                                    children: [
                                      MyListTile(
                                          icon: Icon(Icons.medical_services),
                                          title: "DashBoard",
                                          OnClicked: () =>
                                              routingItem(context, "DashBoard")),
                                      MyListTile(
                                        icon: Icon(Icons.shopping_cart),
                                        title: "Products",
                                        OnClicked: () =>
                                            routingItem(context, "ProductScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.shopping_cart),
                                        title: "Product Categories",
                                        OnClicked: () =>
                                            routingItem(context, "MultiCategoryList"),
                                      ),
                                      MyListTile(
                                        icon:
                                            Icon(Icons.shopping_cart_checkout),
                                        title: "Cart",
                                        OnClicked: () =>
                                            routingItem(context, "CartScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.list),
                                        title: "Orders",
                                        OnClicked: () =>
                                            routingItem(context, "OrdersScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.grid_on),
                                        title: "Catalog",
                                        OnClicked: () =>
                                            routingItem(context, "CatalogScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.manage_search),
                                        title: "Search",
                                        OnClicked: () =>
                                            routingItem(context, "SearchScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.reviews),
                                        title: "Reviews",
                                        OnClicked: () =>
                                            routingItem(context, "ReviewsScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(
                                            Icons.notifications_active_rounded),
                                        title: "Notifications",
                                        OnClicked: () =>
                                            routingItem(context, "NotificationScreen"),
                                      ),
                                      MyListTile(
                                        icon:
                                            Icon(Icons.account_circle_outlined),
                                        title: "User Profile",
                                        OnClicked: () =>
                                            routingItem(context, "UserProfile"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.messenger_outline),
                                        title: "Messages",
                                        OnClicked: () =>
                                            routingItem(context, "MessagesScreen"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.help_outline),
                                        title: "FrequentlyAskedQuestion",
                                        OnClicked: () => routingItem(
                                            context, "FrequentltAskedQue"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.manage_accounts),
                                        title: "Edit Profile",
                                        OnClicked: () =>
                                            routingItem(context, "EditProfile"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.settings),
                                        title: "Settings",
                                        OnClicked: () =>
                                            routingItem(context, "Settings"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.login),
                                        title: "Login",
                                        OnClicked: () =>
                                            routingItem(context, "Login"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.how_to_reg),
                                        title: "Register",
                                        OnClicked: () =>
                                            routingItem(context, "Register"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.phone_iphone),
                                        title: "Enter mobile number",
                                        OnClicked: () => routingItem(
                                            context, "EnterMobileNumber"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.lock_open),
                                        title: "Forgot passwprd",
                                        OnClicked: () => routingItem(
                                            context, "ForgotPassword"),
                                      ),
                                      MyListTile(
                                        icon: Icon(Icons.password),
                                        title: "Reset password",
                                        OnClicked: () => routingItem(
                                            context, "ResetPassword"),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

routingItem(BuildContext context, String routeName) {
  switch (routeName) {


 case "DashBoard":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
      break;

    case "ProductScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductScreen()));
      break;

    case "MultiCategoryList":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MultiCategoryList()));
      break;

    case "CartScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartScreen()));
      break;

    case "OrdersScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrdersScreen()));
      break;

    case "CatalogScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CatalogScreen()));
      break;

    case "SearchScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchScreen()));
      break;

    case "ReviewsScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReviewsScreen()));
      break;

    case "NotificationScreen":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NotificationScreen()));
      break;

    case "UserProfile":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserProfile()));
      break;

    case "MessagesScreen":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MessagesScreen()));
      break;


    case "FrequentltAskedQue":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FrequentlyAskedQuestion()));
      break;

    case "EditProfile":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EditProfile()));
      break;

    case "Settings":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SettingScreen()));
      break;

    case "Login":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      break;

    case "Register":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
      break;

    case "EnterMobileNumber":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MobileNoRegister()));
      break;

    case "ForgotPassword":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ForgotPassword()));
      break;

    case "ResetPassword":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResetPassword()));
      break;
  }
}



class MyListTile extends StatelessWidget {
  MyListTile(
      {Key? key,
      required this.icon,
      required this.title,
      this.trailingIcon,
      this.OnClicked})
      : super(key: key);

  final Icon icon;
  final String title;
  Icon? trailingIcon;
  final VoidCallback? OnClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(title),
        trailing: trailingIcon ?? Icon(Icons.navigate_next),
        onTap: OnClicked);
  }
}
