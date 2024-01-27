import 'package:flutter/material.dart';
import 'package:hamburger_menu/services/product_services.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../ui_components/product_detail.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavourite = false;
  ProductServices services = ProductServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services = Provider.of<ProductServices>(context, listen: false);
    //getSavedFavouriteValue();
  }

  Future<void> getSavedFavouriteValue() async {
    bool savedValue = await services.getPrefs();
    setState(() {
      isFavourite = savedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "S H O P A H O L I C",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Consumer<ProductServices>(
          builder:
              (BuildContext context, ProductServices value, Widget? child) {
            return ProductDetailUIComponent(
              isFav: isFavourite,
              onCartPressed: () {
                value.addToCart(widget.product);
              },
              onFavPressed: (newIsFav) {
                setState(() {
                  isFavourite = newIsFav;
                });
                value.addToWishlist(widget.product, isFavourite);
                value.savePrefs(isFavourite);
                print(value.wishlist);
              },
              product: widget.product,
            );
          },
        ));
  }
}
