import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/pages/Payment/confirmation_order.dart';
import 'package:new_food_delivery/pages/cartpage/cart_page.dart';
import 'package:new_food_delivery/pages/favorite/favorite_page.dart';
import 'package:new_food_delivery/pages/home/home_page.dart';
import 'package:new_food_delivery/pages/login/login_page.dart';
import 'package:new_food_delivery/pages/profile/profile_page.dart';
import 'package:new_food_delivery/pages/support/call_support.dart';
import 'package:new_food_delivery/route/routing_page.dart';

import '../appColors/app_colors.dart';

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
              color: AppColors.kgradientk1,
            ), // BoxDecoration
            accountName: Text(userModel.fullName),
            accountEmail: Text(userModel.emailAddress),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
            ), // CircleAvatar
          ), // User AccountsDrawerHeader
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: ProfilePage(),
              );
            },
            leading: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: CartPage(),
              );
            },
            leading: Icon(
              Icons.shopping_cart_checkout_rounded,
            ),
            title: Text("cart"),
          ),
          // ListTile(
          //   onTap: (){
          //     RoutingPage.goTonext(context: context, navigateTo: FavoritePage(),
          //     );
          //   },
          //   leading: Icon(
          //       Icons.favorite,
          //     ),

          //   title: Text("Favourite"),
          // ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                  context: context, navigateTo: ConfirmationOrder());
            },
            leading: Icon(
              Icons.share_location_sharp,
            ),
            title: Text("My Order"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(context: context, navigateTo: CallSupport());
            },
            leading: Icon(
              Icons.call,
            ),
            title: Text("Contact Support"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    ),
                  );
            },
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
