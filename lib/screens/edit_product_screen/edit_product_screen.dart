import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/EditProductScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Edit Product Screen'),
      ),
    );
  }
}
