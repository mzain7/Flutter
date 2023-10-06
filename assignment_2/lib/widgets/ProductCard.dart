import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductCard(this.productData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                productData['thumbnail'],
                fit: BoxFit.cover,
              )),
          ListTile(
            title: Text(productData['title']),
            subtitle: Text(productData['description']),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${productData['price']}'),
          ),
        ],
      ),
    );
  }
}
