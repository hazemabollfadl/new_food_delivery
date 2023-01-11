import 'package:flutter/material.dart';

class Toppart extends StatelessWidget {
  final String productimage;

  const Toppart({
    Key? key,
    required this.productimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(productimage),
        ),
      ),
    ));
  }
}
