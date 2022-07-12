import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/http.dart';
import 'package:raise_nubjook/pages/make_name_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  BuildContext? context_for_login = null;
  TextEditingController registerID = TextEditingController();
  TextEditingController registerPW = TextEditingController();
  String logInResponse = '';

  void signIn() async {
    var result = await http_post(
        "sign-in",
        {"ID": registerID.text, "PW": registerPW.text}
    );
    if (result.ok) {
      var signin = result.data['status'];
      if (signin == "CORRECT") {
        // go to 1st page
        Navigator.push(
          context_for_login!,
          MaterialPageRoute(builder: (context) => MakeNamePage(registerID.text)),
        );
      }
      else {
        // sign in fail
        setState(() {
          logInResponse = "FAIL: ALREADY REGISTERED USER ID!";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context_for_login = context;
    return Scaffold(
      body: Column(
        children: <Widget> [
          TextField(
            controller: registerID,
            decoration: const InputDecoration(
              hintText: "Enter User ID"
            ),
          ),
          TextField(
            controller: registerPW,
            decoration: const InputDecoration(
              hintText: "Enter User PW"
            ),
          ),
          ElevatedButton(
              onPressed: signIn,
              child: const Text("SIGN IN"),
          ),
          Text(logInResponse),
        ],
      ),
    );
  }
}
