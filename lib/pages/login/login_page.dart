import 'package:flutter/material.dart';
import 'package:new_food_delivery/pages/login/components/center_part.dart';
import 'package:new_food_delivery/pages/login/components/end_part.dart';
import 'package:new_food_delivery/pages/login/components/top_part.dart';
import 'package:new_food_delivery/widgets/my_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //top part
            TopPart(),

            //center part
            CenterPart(),

            //end part
            EndPart(),
          ],
        ),
      ),
    );
  }
}
