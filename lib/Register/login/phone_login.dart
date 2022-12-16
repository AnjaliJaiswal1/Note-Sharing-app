import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_sharing_app/shared.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Login Account",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Hello, Welcome back to your account",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      )),
    );
  }
}

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Text(
            "Phone Number",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          MyTextFormField()
        ],
      ),
    );
  }
}
