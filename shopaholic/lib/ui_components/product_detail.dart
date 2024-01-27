import 'package:flutter/material.dart';
import 'package:shopaholic/models/product_model.dart';
import 'package:shopaholic/services/product_services.dart';

class ProductDetailUIComponent extends StatelessWidget {
  Product product;
  void Function(bool isFav)? onFavPressed;
  void Function()? onCartPressed;
  final bool isFav;

  ProductDetailUIComponent(
      {super.key,
      this.isFav = false,
      required this.product,
      required this.onFavPressed,
      required this.onCartPressed});

  ProductServices services = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              width: double.infinity,
              product.assetPath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          onFavPressed?.call(!isFav);
                          
                        },
                        child: isFav
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline)),
                  )
                ],
              ),
              Text(
                '\$${product.price.toString()}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: onCartPressed,
                    child: const Text("Add to Cart")),
              )
            ],
          ),
        ),
      ],
    );
  }
}
