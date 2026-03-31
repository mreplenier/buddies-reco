import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const LoginTitle(),
  //           const SizedBox(height: 75),
  //           const LoginForm()
  //         ]
  //       )
  //     )
  //   );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoginTitle(),
              const SizedBox(height: 75),
              const LoginForm()
            ]
          ),
        ),
      )
    );
  }

}



class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  final double _fontSize = 50; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Buddie's ",
          style: GoogleFonts.pacifico(fontSize: _fontSize),
        ),
        Text("Reco",
          style: GoogleFonts.pacifico(fontSize: _fontSize, color: Theme.of(context).primaryColor),
        ),
      ],
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
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  // Définitions des fonctions
  void _testLogin () {

    if (_loginFormKey.currentState!.validate()) {
      debugPrint("username: ${_usernameController.text}");
      debugPrint("password: ${_passwordController.text}");
      // setState(() {});
    }
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
    return SizedBox(
      width: 300,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentGeometry.centerStart,
              child: Text(
                "Login",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Le champ doit être rempli.";
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("username"),
                border: OutlineInputBorder()
              ),
              textInputAction: TextInputAction.next
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Le champ doit être rempli.";
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("password"),
                border: OutlineInputBorder()
              ),
              obscureText: true,
              textInputAction: TextInputAction.done
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white
                ),
                onPressed: _testLogin,
                child: const Text("Se connecter")
              ),
            )
          ]
        )
      ),
    );
  }
}


