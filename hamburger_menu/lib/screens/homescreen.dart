// Display product cards

import "package:flutter/material.dart";
import "package:hamburger_menu/services/product_services.dart";
import "package:hamburger_menu/ui_components/product_tile.dart";
import "package:provider/provider.dart";

import "../models/product_model.dart";
import "product_detail_screen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                label: const Text("Search"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          ),
        ),

        // list of products in grid view
        Expanded(
            child: Consumer<ProductServices>(builder: (context, value, child) {
          return GridView.builder(
              itemCount: value.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  mainAxisSpacing: 2),
              itemBuilder: (context, index) {
                Product singleProduct = value.products[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                    product: singleProduct,
                                  )));
                    },
                    child: ProductTile(
                        itemName: singleProduct.title,
                        itemPrice: singleProduct.price,
                        imagePath: singleProduct.assetPath),
                  ),
                );
              });
        })),
      ],
    );
  }
}
