import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(label: Text("username")),
                    cursorWidth: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("password")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
