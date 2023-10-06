import 'dart:convert';

import 'package:assignment_2/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> getProduct() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      return (json.decode(response.body))['products'];
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: FutureBuilder(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(data[index]),
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onDismissed: (diection) {
                    data.remove(data[index]);
                  },
                  child: ProductCard(data[index])),
            );
          }
        },
      ),
    );
  }
}
