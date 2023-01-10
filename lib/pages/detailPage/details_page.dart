import 'package:flutter/material.dart';
import 'package:new_food_delivery/appColors/app_colors.dart';
import 'package:new_food_delivery/pages/detailPage/components/second_part.dart';
import 'package:new_food_delivery/pages/login/components/top_part.dart';
import 'package:new_food_delivery/widgets/my_button.dart';

import 'components/top_part.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Toppart(),
            SecondPart(),
          ],
        ),
      ),
    );
  }
}
