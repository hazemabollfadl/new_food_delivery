// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/widgets/single_product.dart';

import '../pages/detailPage/details_page.dart';
import '../route/routing_page.dart';

class GridViewWidget extends StatelessWidget {
  final String id;
  final String collection;
  final String subCollection;
  const GridViewWidget({
    super.key,
    required this.subCollection,
    required this.id,
    required this.collection,
  });

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(collection)
            .doc(id)
            .collection(subCollection)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Material(
                  elevation: 7,
                  shadowColor: Colors.grey[300],
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      hintText: "Search your product",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
             snapshot.data!.docs.isEmpty?Text("No item"):
              GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.4,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return SingleProduct(
                    onTap: () {
                      RoutingPage.goTonext(
                        context: context,
                        navigateTo: DetailsPage(
                          productimage: data["productimage"],
                          productName: data["productName"],
                          productOldprice: data["productOldprice"],
                          productPrice: data["productPrice"],
                          productRate: data["productRate"],
                          productDescription: data["productDescription"],
                          productID: data["productID"],
                          productCategory: data["productCategory"],
                        ),
                      );
                    },
                    productID: data["productID"],
                    productCategory: data["productCategory"],
                    productRate: data["productRate"],
                    productOldPrice: data["productOldprice"],
                    productPrice: data["productPrice"],
                    productimage: data["productimage"],
                    productName: data["productName"],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
