import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/nubjook.dart';
import 'package:raise_nubjook/pages/first_page.dart';
import 'package:raise_nubjook/pages/second_page.dart';
import 'package:raise_nubjook/pages/third_page.dart';

import 'module/http.dart';


void getNubJookInfo(String? userID) async {
  var res = await http_post('get-info', {"ID": userID});
  var result = res.data;
  MYNUBJOOK = NubJook(
      userID!,
      result['_name'],
      result['_full'],
      result['_smart'],
      result['_stress'],
      result['_level']
  );
}

class WidgetApp extends StatefulWidget {
  String? userID;
  WidgetApp(this.userID, {Key? key});

  @override
  _WidgetApp createState() {
    getNubJookInfo(this.userID);
    return _WidgetApp(this.userID);
  }
}

class _WidgetApp extends State with SingleTickerProviderStateMixin {
  late TabController controller;

  String? userID;
  _WidgetApp(String? userID) {
    this.userID = userID;
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: controller,
          children: const [
            first_page(),
            second_page(),
            third_page(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: TabBar(
            tabs: [
              Tab(icon: Image.asset('assets/nj_icon.png')),
              Tab(icon: Image.asset('assets/game.png')),
              const Tab(icon: Icon(Icons.settings, color: Colors.black, size: 40)),
            ],
            controller: controller,
          ),
        ));
  }
}