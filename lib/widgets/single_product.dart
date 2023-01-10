import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String name;
  final double price;

  final Function()? onTap;
  const SingleProduct({
    required this.onTap,
    required this.image,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12.0),
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcairowestmag.com%2Fbest-burger-places-in-cairo%2F&psig=AOvVaw0q6BAw5WhviN008KzVkkTh&ust=1673395592521000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCOjXicLau_wCFQAAAAAdAAAAABAD"),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
