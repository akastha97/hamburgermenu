import 'package:flutter/material.dart';

class MenuModel {
  String title;
  Icon icon;
  String route;

  MenuModel(this.title, this.icon, {required this.route});

  static List<MenuModel> getMenuList = [
    MenuModel(
        route: "/cart",
        "Cart",
        const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        )),
    MenuModel(
        route: "/wishlist",
        "Wishlist",
        const Icon(Icons.favorite_outline_sharp, color: Colors.white)),
  ];
}
