import 'package:flutter/material.dart';

class Toppart extends StatelessWidget {
  const Toppart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(height: 200, width: double.infinity, color: Colors.teal),
    );
  }
}
