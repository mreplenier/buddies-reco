import 'package:flutter/material.dart';
//import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(BuddiesReco());
}

class BuddiesReco extends StatelessWidget {
  const BuddiesReco({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        home: LoginPage(),
        title: "Buddies Reco"
      ),
    );
  }
}
