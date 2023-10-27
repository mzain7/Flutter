import 'package:assignment_api/models/product.dart';
import 'package:assignment_api/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product productData;

  const ProductCard(this.productData, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: productData),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 200,
                child: Hero(
                  tag: productData.id,
                  child: Image.network(
                    productData.thumbnail,
                    fit: BoxFit.cover,
                  ),
                )),
            ListTile(
              title: Text(productData.title),
              subtitle: Text(productData.description),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\$${productData.price}'),
            ),
          ],
        ),
      ),
    );
  }
}
