import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_food_delivery/main.dart';
import 'package:new_food_delivery/pages/home/home_page.dart';
import 'package:provider/provider.dart';

import '../../appColors/app_colors.dart';
import '../../route/routing_page.dart';
import '../../widgets/my_button.dart';
import '../provider/cart_provider.dart';

class ConfirmationOrder extends StatefulWidget {
  const ConfirmationOrder({super.key});

  @override
  State<ConfirmationOrder> createState() => _ConfirmationOrderState();
}

class _ConfirmationOrderState extends State<ConfirmationOrder> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Order Proccessing",
          style: TextStyle(
            color: AppColors.kblackColor,
          ),
        ),
      ),
      body: cartProvider.getCartList.isEmpty
          ? Center(
              child: Text("No Products"),
            )
          : Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: NetworkImage(
                      "https://thumbs.dreamstime.com/b/people-eating-healthy-meals-wooden-table-top-view-food-delivery-people-eating-healthy-meals-wooden-table-food-delivery-160387494.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Your delicious Food is being prepared",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: AppColors.kgradientk1,
                      size: 200,
                    ),
                  ),
                  SizedBox(
                    height: 91,
                  ),
                  MyButton(
                    onPressed: () {
                      RoutingPage.goTonext(
                        context: context,
                        navigateTo: HomePage(),
                      );
                    },
                    text: "Return to HomePage",
                  )
                ],
              ),
            ),
    );
  }
}
