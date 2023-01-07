import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  const SingleProduct({
    required this.image,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12.0),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://healthyishfoods.com/wp-content/uploads/2020/10/CO0A4937.jpg"),
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
    );
  }
}
