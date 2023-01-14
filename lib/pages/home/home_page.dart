import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/model/user_model.dart';
import 'package:new_food_delivery/widgets/build_drawer.dart';
import 'package:new_food_delivery/widgets/grid_view_widget.dart';

import '../../route/routing_page.dart';
import '../../widgets/single_product.dart';
import '../detailPage/details_page.dart';

late UserModel userModel;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        userModel = UserModel.fromDocument(documentSnapshot);
      } else {
        print("document dosen't exist the Database");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUserDataFunction();
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
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
          ListTile(
            leading: Text(
              "categories ",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 98, 21, 21),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 150,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("categories")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                if (!streamSnapshort.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    return categories(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GridViewWidget(
                              subCollection: streamSnapshort.data!.docs[index]
                                  ["categoryName"],
                              collection: "categories" ,
                              id: streamSnapshort.data!.docs[index].id,
                            ),
                          ),
                        );
                      },
                      categoryName: streamSnapshort.data!.docs[index]
                          ["categoryName"],
                      categoryimage: streamSnapshort.data!.docs[index]
                          ["categoryimage"],
                    );
                  },
                );
              },
            ),
          ),
          ListTile(
            leading: Text(
              "Products ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 280,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                if (!streamSnapshort.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    var data = streamSnapshort.data!.docs[index];

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
                      productimage: data["productimage"],
                      productPrice: data["productPrice"],
                      productName: data["productName"],
                      productCategory: data["productCategory"],
                      productRate: data["productRate"],
                      productOldPrice: data["productOldprice"],
                    );
                  },
                );
              },
            ),
          ),
          ListTile(
            leading: Text(
              "Best Sell ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 200,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("products")
                  .where("productRate", isGreaterThan: 4)
                  .orderBy(
                    "productRate",
                    descending: true,
                  )
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                if (!streamSnapshort.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    var data = streamSnapshort.data!.docs[index];
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
                      productimage: data["productimage"],
                      productPrice: data["productPrice"],
                      productName: data["productName"],
                      productCategory: data["productCategory"],
                      productRate: data["productRate"],
                      productOldPrice: data["productOldprice"],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class categories extends StatelessWidget {
  final String categoryimage;
  final String categoryName;
  final Function()? onTap;

  const categories(
      {Key? key,
      required this.categoryName,
      required this.categoryimage,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.0),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              categoryimage,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.7),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
