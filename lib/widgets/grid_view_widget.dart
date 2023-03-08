// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/widgets/single_product.dart';

import '../pages/detailPage/details_page.dart';
import '../route/routing_page.dart';

class GridViewWidget extends StatefulWidget {
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
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  String query = "";

  var result;
  searchfunction(query, searchlist) {
    result = searchlist.where((element) {
      return element["productName"].toUpperCase().contains(query) ||
          element["productName"].toLowerCase().contains(query) ||
          element["productName"].toUpperCase().contains(query) &&
              element["productName"].toLowerCase().contains(query);
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(widget.collection)
                .doc(widget.id)
                .collection(widget.subCollection)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var varData = searchfunction(query, snapshot.data!.docs);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Material(
                      elevation: 7,
                      shadowColor: Colors.grey[300],
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            query = value;
                          });
                        },
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
                  result.isEmpty
                      ? (Text("Not Found"))
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount: result.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (ctx, index) {
                            var data = varData[index];

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
                                    productDescription:
                                        data["productDescription"],
                                    productID: data["productID"],
                                    productCategory: data["productCategory"],
                                  ),
                                );
                              },
                              productID: data["productID"],
                              productimage: data["productimage"],
                              productPrice: data["productPrice"],
                              productName: data["productName"],
                              productCategory: data["productCategory"],
                              productRate: data["productRate"],
                              productOldPrice: data["productOldprice"],
                            );
                          },
                        )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
