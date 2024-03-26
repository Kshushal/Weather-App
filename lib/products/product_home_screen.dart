import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent.shade100,
        ),
        extendBody: true,
        body: const Column(
          children: [],
        ));
  }
}
