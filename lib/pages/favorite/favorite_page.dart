import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_food_delivery/widgets/grid_view_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridViewWidget(
      collection: "favorite",
      subCollection: "userFavorite",
      id: FirebaseAuth.instance.currentUser!.uid,
    );
  }
}

