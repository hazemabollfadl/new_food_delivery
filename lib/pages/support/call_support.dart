import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../appColors/app_colors.dart';
import '../home/home_page.dart';

class CallSupport extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(CallSupport.pattern.toString());

  @override
  State<CallSupport> createState() => _CallSupportState();
}

class _CallSupportState extends State<CallSupport> {
  TextEditingController Name = TextEditingController(text: userModel.fullName);
  TextEditingController Email =
      TextEditingController(text: userModel.emailAddress);

  void profilevalidation({
    required TextEditingController? Email,
    required TextEditingController? Name,
    required BuildContext context,
  }) async {
    if (Name!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Full name is empty"),
        ),
      );
      return;
    } else if (Email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    } else if (!widget.regExp.hasMatch(Email.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter a valid email address"),
        ),
      );
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Question is Saved"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kgradientk1,
        centerTitle: true,
        title: Text(
          "Support",
          style: TextStyle(
            color: AppColors.kwhiteColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Contact Us!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Feel free to ask your question bellow:-"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: Name,
                    decoration: InputDecoration(
                      hintText: "Name",
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: Email,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: "Message",
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    color: AppColors.kgradientk1,
                    onPressed: () {
                      profilevalidation(
                        context: context,
                        Email: Email,
                        Name: Name,
                      );
                    },
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
