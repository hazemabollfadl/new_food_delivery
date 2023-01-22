// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/appColors/app_colors.dart';
import 'package:new_food_delivery/pages/provider/cart_provider.dart';
import 'package:new_food_delivery/route/routing_page.dart';
import 'package:new_food_delivery/widgets/my_button.dart';
import 'package:new_food_delivery/widgets/single_cart_item.dart';
import 'package:provider/provider.dart';

import '../checkout/check_out_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();
    return Scaffold(
      bottomNavigationBar: cartProvider.getCartList.isEmpty
          ? Text("")
          : MyButton(
              text: "Check Out",
              onPressed: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: CheckOutPage(),
                );
              },
            ),
      appBar: AppBar(
        backgroundColor: AppColors.kgradientk1,
        elevation: 0,
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: AppColors.kwhiteColor,
          ),
        ),
      ),
      body: cartProvider.getCartList.isEmpty
          ? Center(
              child: Text("No Products"),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: cartProvider.getCartList.length,
              itemBuilder: (ctx, index) {
                var data = cartProvider.cartList[index];
                return SingleCartItem(
                  productID: data.productID,
                  productimage: data.productimage,
                  productPrice: data.productPrice,
                  productQuantity: data.productQuantity,
                  productName: data.productName,
                  productCategory: data.productCategory,
                );
              },
            ),
    );
  }
}
