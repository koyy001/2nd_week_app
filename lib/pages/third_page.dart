import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/http.dart';
import '../module/nubjook.dart';



class third_page extends StatelessWidget
{
  const third_page({Key? key}) : super(key: key);
  
  void SaveInfo() async {
    var response = {
      "ID": MYNUBJOOK.userID,
      "name": MYNUBJOOK.name,
      "full": MYNUBJOOK.full,
      "smart": MYNUBJOOK.smart,
      "stress": MYNUBJOOK.stress,
      "level": MYNUBJOOK.level,
    };
    var result = await http_post('save-info', response);
  }

  void LogOut() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Column(
          children: <Widget> [
            ElevatedButton(
                onPressed: SaveInfo,
                child: Text("저장하기"),
            ),
            ElevatedButton(
                onPressed: LogOut,
                child: Text("로그아웃")
            ),
          ],
        ),
    );
  }
}