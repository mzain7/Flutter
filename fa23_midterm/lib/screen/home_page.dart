import 'dart:convert';
import 'package:fa23_midterm/models/product.dart';
import 'package:fa23_midterm/widgets/CardList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Product>> fetchData() async {
      try {
        var res =
            await http.get(Uri.parse('https://fakestoreapi.com/products'));

        if (res.statusCode == 200) {
          List<dynamic> data = json.decode(res.body);
          var productList = data.map((e) => Product.fromJson(e)).toList();
          // productList.shuffle();
          return productList;
        } else {
          return [];
        }
      } catch (err) {
        return [];
      }
    }

    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            appBar: AppBar(
              title: const Text('Product List'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: snapshot.data!.isNotEmpty
                ? CardList(
                    productList: snapshot.data!,
                  )
                : Center(
                    child: Text(
                      'Something went wron!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
