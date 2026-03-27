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
            child: LoginForm()
          ),
        )
      )
    );
  }
}



class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

// Définition des Variables  
final _trueUsername = "orlane";
final _truePassword = "chazelle";

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

final _loginFormKey = GlobalKey<FormState>();

  // Définitions des fonctions
  void _testLogin () {

  //   if (_loginFormKey.currentState!.validate()) {
  //     if (_usernameController.text == _trueUsername && _passwordController.text == _truePassword) {
        
  //     }
    setState(() {});
    Text(_loginFormKey.currentState!.validate().toString());


  }

  // Permet de libérer la mémoire si le formulaire est détruit
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              label: Text("username"),
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text("password"),
              border: OutlineInputBorder()
            ),
            obscureText: true
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _testLogin,
            child: const Text("Valider")
          )
        ]
      )
    );
  }
}


