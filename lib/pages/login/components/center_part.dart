import 'package:flutter/material.dart';

class CenterPart extends StatelessWidget {
  const CenterPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email ",
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: IconButton(
              onPressed: () {
                ;
              },
              icon: Icon(
                Icons.visibility,
              ),
            ),
          ),
        ),
      ],
    );
  }
}