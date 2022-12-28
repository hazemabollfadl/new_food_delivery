import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/logo.jpg",
                scale: 7,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
