import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/http.dart';
import '../widget_app.dart';



class third_page extends StatefulWidget {
  const third_page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _third_page_state();
}

class _third_page_state extends State<StatefulWidget> {
  void SaveInfo() async {
    var response = {
      "ID": MYNUBJOOK!.userID,
      "name": MYNUBJOOK!.name,
      "full": MYNUBJOOK!.full,
      "smart": MYNUBJOOK!.smart,
      "stress": MYNUBJOOK!.stress,
      "level": MYNUBJOOK!.level,
    };
    await http_post('save-info', response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        child:
          Row(
            children: [
              SizedBox(width: 130),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  ElevatedButton(
                    onPressed: SaveInfo,
                    child: Text("SAVE"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("LOG OUT")
                  ),
                ],
              ),

            ],
          )

      )

    );
  }
}