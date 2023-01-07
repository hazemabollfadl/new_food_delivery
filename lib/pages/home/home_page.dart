import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/model/user_model.dart';
import 'package:new_food_delivery/widgets/build_drawer.dart';
import 'package:new_food_delivery/widgets/grid_view_widget.dart';

import '../../widgets/single_product.dart';

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
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 100,
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
                              collection: streamSnapshort.data!.docs[index]
                                  ["categoryName"],
                              id: streamSnapshort.data!.docs[index].id,
                            ),
                          ),
                        );
                      },
                      categoryName: streamSnapshort.data!.docs[index]
                          ["categoryName"],
                      image: streamSnapshort.data!.docs[index]["categoryimage"],
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
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // SingleProduct(),
                // SingleProduct(),
              ],
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
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // SingleProduct(),
                // SingleProduct(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class categories extends StatelessWidget {
  final String image;
  final String categoryName;
  final Function()? onTap;

  const categories(
      {Key? key,
      required this.categoryName,
      required this.image,
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
              image,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(categoryName),
        ),
      ),
    );
  }
}
