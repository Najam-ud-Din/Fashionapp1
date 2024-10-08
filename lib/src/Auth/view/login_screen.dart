import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/common/widgets/password_field.dart';
import 'package:fashion_app/src/profile/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginSceen extends StatefulWidget {
  const LoginSceen({super.key});

  @override
  State<LoginSceen> createState() => _LoginSceenState();
}

class _LoginSceenState extends State<LoginSceen> {
  late final TextEditingController _usernamecontroller =
      TextEditingController();
  late final TextEditingController _passwordcontroller =
      TextEditingController();

  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: AppBackButton(
          onTap: () {
            context.go('/home');
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 160.h,
          ),
          Text(
            "Fashion",
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Hi! Welcome back. You have been mmissed",
            style: appStyle(13, Kolors.kGray, FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: "Username",
                  controller: _usernamecontroller,
                  prefixIcon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Kolors.kGray,
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                PasswordField(
                  controller: _passwordcontroller,
                  focusNode: _passwordNode,
                  radius: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "LOGIN",
                    style: appStyle(10, Kolors.kOffWhite, FontWeight.normal),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130.h,
        child: Center(
          child: GestureDetector(
            onTap: () {
              context.push("/register");
            },
            child: Text(
              "Do not have an account? register a new account",
              style: appStyle(12, Colors.blue, FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
