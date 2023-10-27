import 'package:fa23_midterm/models/product.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.productList});
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        var product = productList[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(product.image, fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[400],
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product.price}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating.rate} by ${product.rating.count} users',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
