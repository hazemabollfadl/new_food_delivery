import 'package:flutter/material.dart';

import '../../../widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(onPressed: () {}, text: "Log IN"),
      ],
    );
    SizedBox(
      height: 20,
    );
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?\t\t"),
        Text(
          "SIGN UP",
        )
      ],
    );
  }
}
