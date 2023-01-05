import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/pages/login/login_page.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ), // BoxDecoration
            accountName: Text("Yaqoob Developer"),
            accountEmail: Text("yaqoobkafeel580@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/logo.jpg"),
            ), // CircleAvatar
          ), // User AccountsDrawerHeader
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
              ),
            ),
            title: Text("Profile"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_checkout_rounded,
              ),
            ),
            title: Text("cart"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
              ),
            ),
            title: Text("Favourite"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_location_sharp,
              ),
            ),
            title: Text("My Order"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                    );
              },
              icon: Icon(
                Icons.exit_to_app,
              ),
            ),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
