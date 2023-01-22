import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/appColors/app_colors.dart';
import 'package:new_food_delivery/pages/Payment/confirmation_order.dart';
import 'package:new_food_delivery/pages/Payment/payment_interface.dart';
import 'package:new_food_delivery/widgets/my_button.dart';
import 'package:provider/provider.dart';

import '../../route/routing_page.dart';
import '../../widgets/single_cart_item.dart';
import '../home/home_page.dart';
import '../provider/cart_provider.dart';

class PaymentInterface extends StatefulWidget {
  const PaymentInterface({Key? key}) : super(key: key);

  @override
  State<PaymentInterface> createState() => _PaymentInterfaceState();
}

class _PaymentInterfaceState extends State<PaymentInterface> {
  String? paymentOption;
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
          "Payment",
          style: TextStyle(
            color: AppColors.kblackColor,
          ),
        ),
      ),
      body: cartProvider.getCartList.isEmpty
          ? Center(
              child: Text("No Products"),
            )
          : Column(children: [
              Expanded(
                flex: 1,
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
              Text(
                "Payment Options:-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              RadioListTile(
                activeColor: AppColors.kgradientk1,
                title: Text("Pay with cash"),
                value: "payWithCash",
                groupValue: paymentOption,
                onChanged: (value) {
                  setState(() {
                    paymentOption = value.toString();
                  });
                },
              ),
              RadioListTile(
                activeColor: AppColors.kgradientk1,
                title: Text("Pay with Visa (Not available Yet)"),
                value: "payWithVisa",
                groupValue: paymentOption,
                onChanged: (value) {
                  setState(() {
                    paymentOption = value.toString();
                  });
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Text("Your Phone Number:"),
                      trailing: Text(userModel.phoneNum),
                    ),
                    ListTile(
                      leading: Text("Your Location:"),
                      trailing: Text(userModel.userLocation),
                    ),
                    ListTile(
                      leading: Text("Total:"),
                      trailing: Text("\$ $totalPrice"),
                    ),
                    cartProvider.getCartList.isEmpty
                        ? Text("")
                        : MyButton(
                            onPressed: () {
                              RoutingPage.goTonext(
                                context: context,
                                navigateTo: ConfirmationOrder(),
                              );
                            },
                            text: "Confirm Order",
                          )
                  ],
                ),
              )
            ]),
    );
  }
}
