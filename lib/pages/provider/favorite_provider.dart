import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  void favorite({
    required productID,
    required productCategory,
    required productRate,
    required productOldPrice,
    required productPrice,
    required productimage,
    required productFavorite,
    required productName,
  }) {
    FirebaseFirestore.instance
        .collection("favorite")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("userFavorite")
        .doc("productID")
        .set(
      {
        "productID": productID,
        "productCategory": productCategory,
        "productRate": productRate,
        "productOldPrice": productOldPrice,
        "productPrice": productPrice,
        "productimage": productimage,
        "productFavorite": productFavorite,
        "productName": productName,
      },
    );
  }
}
