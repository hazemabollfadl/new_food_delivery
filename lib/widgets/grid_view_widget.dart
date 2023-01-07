import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

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
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshort) {
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.red,
              );
            },
          );
        },
      ),
      // body: Column(
      //   children: [
      //     // Padding(
      //     //   padding: const EdgeInsets.all(0.0),
      //     //   child: Material(
      //     //     elevation: 7,
      //     //     shadowColor: Colors.grey[300],
      //     //     child: TextFormField(
      //     //       decoration: InputDecoration(
      //     //         prefixIcon: Icon(Icons.search),
      //     //         fillColor: Colors.white,
      //     //         hintText: "Search your product",
      //     //         filled: true,
      //     //         border: OutlineInputBorder(
      //     //           borderSide: BorderSide.none,
      //     //         ),
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }
}
