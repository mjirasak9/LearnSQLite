import 'package:flutter/material.dart';
import 'package:mjeetrn33/states/productadd.dart';
import 'package:mjeetrn33/states/productlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
}
