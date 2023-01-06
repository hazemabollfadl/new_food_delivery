import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_food_delivery/model/user_model.dart';
import 'package:new_food_delivery/widgets/build_drawer.dart';

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
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categories(
                  categoryName: "Food",
                  image: "images/logo.jpg",
                ),
                categories(
                  categoryName: "burger",
                  image: "images/logo.jpg",
                ),
              ],
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
                SingleProduct(),
                SingleProduct(),
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
                SingleProduct(),
                SingleProduct(),
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

  const categories({Key? key, required this.categoryName, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(categoryName),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(12.0),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              "\$30",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ))
      ],
    );
  }
}
