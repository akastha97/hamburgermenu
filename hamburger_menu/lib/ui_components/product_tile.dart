import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;


  ProductTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4, top: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${itemPrice.toString()}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
