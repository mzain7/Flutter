import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/Product.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = TextEditingController(text: '');
  // List<Product>? products;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchAPIData() async {
    print('Fetching API Data...');
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var products = data['products'] as List<dynamic>;
      storeData(products);
    } else {
      debugPrint('Error: ${response.statusCode}');
    }
  }

  Future<void> storeData(List<dynamic> productJson) async {
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    productsCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    // productsCollection.doc('1').set({'title': 'Hello'});
    for (var product in productJson) {
      await productsCollection.doc(product['id'].toString()).set(product);
    }
  }

  Future<List<Product>> getData() async {
    await fetchAPIData();
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await productsCollection.get() as QuerySnapshot<Map<String, dynamic>>;
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
        snapshot.docs;
    List<Product> products =
        docs.map((e) => Product.fromJson(e.data())).toList();
    return products;
  }

  Future<void> deleteData(String id) {
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    productsCollection.doc(id).delete();
    return Future.value();
  }

  Future<void> updateData(Product product) {
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    productsCollection.doc(product.id.toString()).update(product.toJson());
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Demo'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
