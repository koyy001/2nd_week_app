import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/http.dart';
import 'package:raise_nubjook/widget_app.dart';

class MakeNamePage extends StatefulWidget {
  String? userID;
  MakeNamePage(this.userID, {Key? key});

  @override
  State<StatefulWidget> createState() {
    return MakeNamePageState(this.userID);
  }
}

class MakeNamePageState extends State<MakeNamePage> {
  String? userID;
  MakeNamePageState(String? userID) {
    this.userID = userID;
  }

  BuildContext? context_for_login = null;
  TextEditingController _name = TextEditingController();

  void makeName() async {
    var result = await http_post(
      "make-name",
      {"ID": this.userID, "_name": _name.text}
    );
    if (result.ok) {
      Navigator.push(
        context_for_login!,
        MaterialPageRoute(builder: (context) => WidgetApp(this.userID)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context_for_login = context;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              hintText: "Enter your Nubjook's Name",
            ),
          ),
          ElevatedButton(
              onPressed: makeName,
              child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}