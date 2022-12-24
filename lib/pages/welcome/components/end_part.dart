import 'package:flutter/material.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {},
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(04),
          ),
          padding: EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff027f47),
                    Color(0xff01a95c),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(04)),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                "LOG IN",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            print("click");
          },
          child: Text(
            "SIGNUP",
            style: TextStyle(color: Color(0xff797b7a)),
          ),
        )
      ],
    );
  }
}
