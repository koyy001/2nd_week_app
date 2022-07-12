import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/http.dart';
import 'package:raise_nubjook/pages/signin_page.dart';
import 'package:raise_nubjook/pages/make_name_page.dart';
import 'package:raise_nubjook/widget_app.dart';



void main() {
  runApp(const MyApp());
}

// 첫 화면은 "넙죽이 키우기 게임 시작화면"을 띄우자!
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstRoute(),
    );
  }
}

// "넙죽이 키우기 게임 시작화면"
class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstRouteState();
  }
}
class FirstRouteState extends State<FirstRoute> {
  BuildContext? context_for_login;
  TextEditingController userID = TextEditingController();
  TextEditingController userPW = TextEditingController();
  String logInResponse = '';

  void logIn() async {
    var result = await http_post(
      "log-in",
      {"ID": userID.text, "PW": userPW.text}
    );
    if (result.ok) {
      var login = result.data['status'];
      if (login == "CORRECT") {
        // go to 1st page
        setState(() {logInResponse = "Log In Successful!!";});
        if (result.data['new_user'] == 1) {
          Navigator.push(
            context_for_login!,
            MaterialPageRoute(builder: (context) => MakeNamePage(userID.text)),
          );
        }
        else {
          Navigator.push(
            context_for_login!,
            MaterialPageRoute(builder: (context) => WidgetApp(userID.text)),
          );
        }
      }
      else {
        // log in fail
        setState(() {logInResponse = "FAIL: ENTER THE CORRECT ID/PW!";});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context_for_login = context;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          TextField(
            controller: userID,
            decoration: const InputDecoration(
              hintText: "Enter User ID"
            ),
          ),
          TextField(
            controller: userPW,
            decoration: const InputDecoration(
              hintText: "Enter User PW"
            ),
          ),
          ElevatedButton(
              onPressed: logIn,
              child: const Text("LOG IN"),
          ),
          Text(logInResponse),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: const Text("SIGN IN"),
          ),
        ]
      ),
    );
  }
}

