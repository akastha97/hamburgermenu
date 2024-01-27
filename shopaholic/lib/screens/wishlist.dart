import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../services/product_services.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S H O P A H O L I C'),
      ),
      body: Column(children: [
        const Text("WISHLIST"),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Consumer<ProductServices>(builder:
              (BuildContext context, ProductServices value, Widget? child) {
            return ListView.builder(
                itemCount: value.wishlist.length,
                itemBuilder: (context, index) {
                  Product _wishlistProduct = value.wishlist[index];

                  return Container(
                    child: Card(
                      child: ListTile(
                        leading: ClipOval(
                          child: Image.asset(
                            _wishlistProduct.assetPath,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(value.wishlist[index].title),
                                Text('\$' + value.wishlist[index].price),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    value.addToCart(_wishlistProduct);
                                    value.addToWishlist(_wishlistProduct, false);
                                  },
                                  child: const Text("Add to Cart")),
                            )
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  value.addToWishlist(_wishlistProduct, false);
                                },
                                child: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
        ),
      ]),
    );
  }
}
