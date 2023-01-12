import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String productID;
  final String productimage;
  final double productPrice;
  final int productQuantity;
  final String productName;
  final String productCategory;
  CartModel({
    required this.productID,
    required this.productimage,
    required this.productPrice,
    required this.productName,
    required this.productCategory,
    required this.productQuantity,
  });
  factory CartModel.fromDocument(QueryDocumentSnapshot doc) {
    return CartModel(
      productID: doc["productID"],
      productimage: doc["productimage"],
      productPrice: doc["productPrice"],
      productQuantity: doc["productQuantity"],
      productName: doc["productName"],
      productCategory: doc["productCategory"],
    );
  }
}
