import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            CupertinoFormSection(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text("Username"),
                  placeholder: "mreplenier",
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text("Password"),
                  obscureText: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
