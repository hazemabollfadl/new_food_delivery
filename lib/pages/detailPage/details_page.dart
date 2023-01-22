import 'package:flutter/material.dart';
import 'package:new_food_delivery/appColors/app_colors.dart';
import 'package:new_food_delivery/pages/detailPage/components/second_part.dart';
import 'package:new_food_delivery/pages/login/components/top_part.dart';
import 'package:new_food_delivery/widgets/my_button.dart';

import 'components/top_part.dart';

class DetailsPage extends StatelessWidget {
  final String productimage;
  final String productName;
  final double productPrice;
  final double productOldprice;
  final int productRate;
  final String productDescription;
  final String productID;
  final String productCategory;

  const DetailsPage({
    Key? key,
    required this.productName,
    required this.productimage,
    required this.productPrice,
    required this.productOldprice,
    required this.productRate,
    required this.productDescription,
    required this.productID,
    required this.productCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kgradientk1,
        title: Text(
          "Item Details",
          style: TextStyle(
            color: AppColors.kwhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Toppart(
              productimage: productimage,
            ),
            SecondPart(
              productimage: productimage,
              productID: productID,
              productDescription: productDescription,
              productName: productName,
              productOldPrice: productOldprice,
              productPrice: productPrice,
              productRate: productRate,
              productCategory: productCategory,
            ),
          ],
        ),
      ),
    );
  }
}
