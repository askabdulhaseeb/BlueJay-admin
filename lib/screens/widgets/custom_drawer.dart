import 'package:flutter/material.dart';
import 'package:pantrycheck_admin/database/auth.dart';
import 'package:pantrycheck_admin/database/user_local_data.dart';
import 'package:pantrycheck_admin/screens/add_product_screen/add_product_screen.dart';
import 'package:pantrycheck_admin/screens/widgets/copyrights.dart';
import 'package:pantrycheck_admin/screens/widgets/custom_image.dart';
import 'package:pantrycheck_admin/utilities/utilities.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            _userInfo(),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            // Other Buttons
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Product'),
              onTap: () => Navigator.of(context).pushNamed(
                AddProductScreen.routeName,
              ),
            ),
            // ListTile(
            //   leading: const Icon(Icons.add),
            //   title: const Text('Add Admin'),
            //   onTap: () {},
            // ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => AuthMethod().signOut(),
            ),
            Copyrights(),
          ],
        ),
      ),
    );
  }

  Row _userInfo() {
    return Row(
      children: <Widget>[
        CircularProfileImage(
          imageUrl: UserLocalData.getUserImageUrl,
          radius: 50,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                UserLocalData.getUserDisplayName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                ' ${UserLocalData.getUserEmail}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
