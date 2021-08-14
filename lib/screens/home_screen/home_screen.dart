import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantrycheck_admin/screens/add_product_screen/add_product_screen.dart';
import 'package:pantrycheck_admin/screens/widgets/custom_search.dart';
import 'package:pantrycheck_admin/utilities/utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          SizedBox(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName);
              },
              icon: Icon(
                CupertinoIcons.add,
                color: Theme.of(context).iconTheme.color,
              ),
              splashRadius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Column(
          children: const <Widget>[
            CustomSearch(),
          ],
        ),
      ),
    );
  }
}
