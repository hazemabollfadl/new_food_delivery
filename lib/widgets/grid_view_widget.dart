// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/widgets/single_product.dart';

class GridViewWidget extends StatelessWidget {
  final String id;
  final String collection;
  const GridViewWidget({
    super.key,
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
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("categories")
            .doc(id)
            .collection(collection)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return //Column(
              // children: [
              //   Padding(
              //   padding: const EdgeInsets.all(0.0),
              //   child: Material(
              //     elevation: 7,
              //     shadowColor: Colors.grey[300],
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         prefixIcon: Icon(Icons.search),
              //         fillColor: Colors.white,
              //         hintText: "Search your product",
              //         filled: true,
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              GridView.builder(
            //shrinkWrap: true,
            // itemCount: snapshot.data?.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.4,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              // var data = snapshot.data!.docs[index];
              return SingleProduct(
                  // image: data["productImage"],
                  // name: data["productName"],
                  // price: data["priductPrice"],
                  );
            },
          );
          //],
          //);
        },
      ),
    );
  }
}
