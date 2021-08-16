import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantrycheck_admin/database/product_firebase_api.dart';
import 'package:pantrycheck_admin/model/product.dart';
import 'package:pantrycheck_admin/screens/add_product_screen/add_product_screen.dart';
import 'package:pantrycheck_admin/screens/widgets/custom_drawer.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Column(
          children: <Widget>[
            const CustomSearch(),
            FutureBuilder<List<Product>>(
              future: ProductFirebaseAPI().getAllProducts(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Product>> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.data!.length == 0) {
                      return const Center(child: Text('No Product Fount'));
                    } else {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Product _pro = snapshot.data![index];
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Image.network(_pro.imageURL ?? ''),
                                  ),
                                  Text(
                                    'Name: ${_pro.name ?? 'No Name'}',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Price: ${_pro.price}'),
                                  Text('Quantity: ${_pro.qty}'),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: Theme.of(context).iconTheme,
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
    );
  }
}
