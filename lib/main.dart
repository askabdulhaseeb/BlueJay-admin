import 'package:flutter/material.dart';
import 'screens/add_product_screen/add_product_screen.dart';
import 'screens/edit_product_screen/edit_product_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/login_screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueJay',
      theme: ThemeData(
        primaryColor: Colors.blue,
        splashColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.blue),
        
      ),
      home: const LoginScreen(),
      routes: <String, WidgetBuilder>{
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        AddProductScreen.routeName: (_) => const AddProductScreen(),
        EditProductScreen.routeName: (_) => const EditProductScreen(),
      },
    );
  }
}
