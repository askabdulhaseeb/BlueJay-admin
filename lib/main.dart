import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantrycheck_admin/providers/primary_category_provider.dart';
import 'package:provider/provider.dart';
import 'database/user_local_data.dart';
import 'screens/add_product_screen/add_product_screen.dart';
import 'screens/edit_product_screen/edit_product_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserLocalData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<CategoryProvider>.value(
          value: CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'BlueJay',
        theme: ThemeData(
          primaryColor: Colors.blue,
          splashColor: Colors.blue[200],
          iconTheme: const IconThemeData(color: Colors.blue),
        ),
        home: (UserLocalData.getUserUID != '')
            ? const HomeScreen()
            : const LoginScreen(),
        routes: <String, WidgetBuilder>{
          LoginScreen.routeName: (_) => const LoginScreen(),
          HomeScreen.routeName: (_) => const HomeScreen(),
          AddProductScreen.routeName: (_) => const AddProductScreen(),
          // EditProductScreen.routeName: (_) => const EditProductScreen(),
        },
      ),
    );
  }
}
// flutter build web
// firebase deploy --only hosting
// live link: https://bluejay-4e4f8.web.app