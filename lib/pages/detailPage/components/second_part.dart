import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/pages/cartpage/cart_page.dart';
import 'package:new_food_delivery/route/routing_page.dart';

import '../../../appColors/app_colors.dart';
import '../../../widgets/my_button.dart';

class SecondPart extends StatelessWidget {
  final String productName;
  final double productPrice;
  final double productOldPrice;
  final int productRate;
  final String productDescription;

  const SecondPart({
    Key? key,
    required this.productDescription,
    required this.productName,
    required this.productPrice,
    required this.productOldPrice,
    required this.productRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text("\$$productPrice"),
              SizedBox(
                width: 20,
              ),
              Text("\$$productOldPrice",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ))
            ],
          ),
          Column(
            children: [
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.kgradientk1,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        productRate.toString(),
                        style: TextStyle(
                          color: AppColors.kblackColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "50 Reviews",
                    style: TextStyle(
                      color: AppColors.kgradientk1,
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
          Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            productDescription,
            style: TextStyle(),
          ),
          MyButton(
              onPressed: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: cartpage(),
                );
              },
              text: "Add to cart"),
        ],
      ),
    );
  }
}
