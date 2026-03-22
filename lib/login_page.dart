import 'package:flutter/material.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Définition des Variables  
  final _trueUsername = "orlane";
  final _truePassword = "chazelle";

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  // Définitions des fonctions
  void _testLogin () {

    if (_loginFormKey.currentState!.validate()) {
      if (_usernameController.text == _trueUsername && _passwordController.text == _truePassword) {

      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      label: Text("username"),
                      border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      label: Text("password"),
                      border: OutlineInputBorder()
                    )
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _testLogin,
                    child: Text("Valider")
                  )
                ]
              )
            )
          ),
        ),
      ),
    );
  }
}
