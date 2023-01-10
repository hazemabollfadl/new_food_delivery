import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../appColors/app_colors.dart';
import '../../../widgets/my_button.dart';

class SecondPart extends StatelessWidget {
  const SecondPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "productName",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text("\$40"),
              SizedBox(
                width: 20,
              ),
              Text("\$50",
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
                        "4.5",
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
            " eyad amir bassem omar hazem ",
            style: TextStyle(),
          ),
          MyButton(onPressed: () {}, text: "Add to cart"),
        ],
      ),
    );
  }
}
