import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/appColors/app_colors.dart';
import 'package:new_food_delivery/widgets/my_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/single_cart_item.dart';
import '../provider/cart_provider.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();

    double subTotal = cartProvider.subtotal();

    double discount = 5;
    int shipping = 10;
    double discountValue = (subTotal * discount) / 100;
    double value = subTotal - discountValue;
    double totalPrice = value += shipping;
    if (cartProvider.getCartList.isEmpty) {
      setState(() {
        totalPrice = 0.0;
      });
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Check out",
          style: TextStyle(
            color: AppColors.kblackColor,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: cartProvider.getCartList.isEmpty
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
        ),
        Expanded(
          child: Column(
            children: [
              ListTile(
                leading: Text("Sub Total"),
                trailing: Text("\$ $subTotal"),
              ),
              ListTile(
                leading: Text("Discount"),
                trailing: Text("%5"),
              ),
              ListTile(
                leading: Text("Shipping"),
                trailing: Text("\$10"),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Text("Total"),
                trailing: Text("\$ $totalPrice"),
              ),
              cartProvider.getCartList.isEmpty
                  ? Text("")
                  : MyButton(
                      onPressed: () => print("button"),
                      text: "Buy",
                    )
            ],
          ),
        )
      ]),
    );
  }
}
