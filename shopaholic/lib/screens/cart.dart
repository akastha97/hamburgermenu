import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../services/product_services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: Column(children: [
        const Text("CART"),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Consumer<ProductServices>(builder:
              (BuildContext context, ProductServices value, Widget? child) {
            return ListView.builder(
                itemCount: value.cartlist.length,
                itemBuilder: (context, index) {
                  Product _cartProduct = value.cartlist[index];
                  //Product _wishlistProduct = value.wishlist[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: ClipOval(
                          child: Image.asset(
                            _cartProduct.assetPath,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(_cartProduct.title),
                            Text('\$${_cartProduct.price}'),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  value.removeFromCart(_cartProduct);
                                },
                                child: const Icon(Icons.delete)),
                            GestureDetector(
                                onTap: () {
                                  value.removeFromCart(_cartProduct);
                                  value.addToWishlist(_cartProduct, true);
                                },
                                child: const Icon(Icons.favorite)),
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
