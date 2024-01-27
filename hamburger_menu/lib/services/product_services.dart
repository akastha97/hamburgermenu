import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

class ProductServices extends ChangeNotifier {
  // get the products list
  List<Product> products = [
    Product(
        title: "Blouse",
        price: "15.00",
        assetPath: "lib/assets/slippers.jpeg",
        description: "This blouse is of Satin Material"),
    Product(
        title: "Boxer Shorts",
        description:
            "This shorts is so soft that it is comforable to wear not only for working out but also for lounging",
        price: "10.00",
        assetPath: "lib/assets/boxer_shorts.jpeg"),
    Product(
        title: "Puffer jacket",
        price: "40.00",
        description: "This can take cold even during winter storm",
        assetPath: "lib/assets/puffer.jpeg"),
    Product(
        description:
            "Sweater which will make you feel cozy, not only for winters",
        title: "Sweater",
        price: "15.00",
        assetPath: "lib/assets/sweater.jpeg"),
    Product(
        description:
            "Buttery soft tshirt, for lounging, also you can pair with office wear",
        title: "Tshirt",
        price: "15.00",
        assetPath: "lib/assets/tshirt.jpeg"),
    Product(
        description: "Slippery slippery soft and comfortable feet",
        title: "Slippers",
        price: "15.00",
        assetPath: "lib/assets/slippers.jpeg")
  ];

  // cart items

  List<Product> cartlist = [];

  // wishlist items

  List<Product> wishlist = [];

  // getters
  get cartitems => cartlist;

  get wishlistitems => wishlist;

  // add to cart
  void addToCart(Product product) {
    cartlist.add(product);
    notifyListeners();
  }

  // delete from cart
  void removeFromCart(Product product) {
    cartlist.remove(product);
    notifyListeners();
  }

  // add to wishlist
  void addToWishlist(Product product, bool isFav) {
    if (isFav == true) {
      wishlist.add(product);
      notifyListeners();
    } else {
      wishlist.remove(product);
      notifyListeners();
    }
  }

  Future<void> savePrefs(bool fav) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('fav', fav);
  }

  Future<bool> getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('fav') ?? false;
  }
}
