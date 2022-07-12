import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:raise_nubjook/module/nubjook.dart';

class second_page extends StatelessWidget {
  const second_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstRoute(),
    );
  }
}

////////////////////////////게임 목록 페이지////////////////////////////
class FirstRoute extends StatelessWidget {
  ////////////////////////////GameList////////////////////////////
  Widget GameList = Container(  // 하나의 직사각형 생성
    padding: const EdgeInsets.only(top:40),  // 직사각형 위에 20만큼 padding
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
      children: [const Text('Game List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            GameList,
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('주사위 게임', style: TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DicePage()),
                );
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('묵찌빠 게임', style: TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RSPPage()),
                );
              },
            ),
          ]
      ),
    );
  }
}

////////////////////////////주사위 페이지////////////////////////////
class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePage();
}

class _DicePage extends State<DicePage> {
  String n_imgsource ="";
  String p_imgsource ="";
  String whoIsWin ="";
  int leftDice = 0;
  int rightDice = 0;
  @override
  Widget build(BuildContext context) {


    if(leftDice<rightDice)
    {
      n_imgsource='assets/sad.png';
      p_imgsource='assets/m_happy.png';
      whoIsWin='넙죽이 패배';
      setState(() {
        if (MYNUBJOOK.stress < 4) {
          MYNUBJOOK.stress = MYNUBJOOK.stress + 1;
        }
      });
    }
    else if(leftDice==rightDice)
    {
      n_imgsource='assets/nj_icon.png';
      p_imgsource='assets/no_face.png';
      whoIsWin='동점!';
    }
    else
    {
      n_imgsource='assets/happy.png';
      p_imgsource='assets/m_sad.png';
      whoIsWin='넙죽이 승리';
      setState(() {
        if (MYNUBJOOK.stress > 0) {
          MYNUBJOOK.stress = MYNUBJOOK.stress - 1;
        }
      });
    }


    ////////////////////////////titleSection////////////////////////////
    Widget titleSection = Container(  // 하나의 직사각형 생성
      padding: const EdgeInsets.only(top:20),  // 직사각형 위에 20만큼 padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
        children: [const Text('주사위 게임', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))],
      ),
    );

    // 게임 시작 전
    if (leftDice==0)
    {
      n_imgsource='assets/nj_icon.png';
      p_imgsource='assets/no_face.png';
      whoIsWin=' ';
      return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              titleSection,
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(n_imgsource, width: 120),
                  SizedBox(width: 70.0),
                  Image.asset(p_imgsource, width: 80),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Dice_no.png', width: 100),
                  SizedBox(width: 70),
                  Image.asset('assets/Dice_no.png', width: 100),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Container(
                  padding:const EdgeInsets.only(top: 50),
                  child:Text(whoIsWin, style: TextStyle(fontSize: 30),)
              ),
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 170)),
                    ButtonTheme(
                      minWidth: 100,
                      height: 50,
                      child: ElevatedButton(
                          child: Text('play!'),
                          onPressed: (){
                            setState(() {
                              leftDice = Random().nextInt(6) + 1;
                              rightDice = Random().nextInt(6) + 1;
                            });
                            //myToast('넙죽이 : $leftDice , 주인 : $rightDice ');
                          }),
                    ),
                    Padding(padding: EdgeInsets.only(right: 70)),
                    ButtonTheme(
                      minWidth: 100,
                      height: 20,
                      child: ElevatedButton(
                          child: Text('go back'),
                          onPressed: (){
                            Navigator.pop(context); //임마를 하면 화면 종료
                            //Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => first_page())); //버튼이 눌리는 이벤트 발생 시, 다음 페이지에서 전달 받을 string 변수와 value('SecondRoute_Delivered')값을 직접 전달
                          }),
                    ),
                  ]

              )


            ],
          ),
        ),
      );
    }
    // 게임 시작 후
    else
    {
      return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              titleSection,
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(n_imgsource, width: 120),
                  SizedBox(width: 70.0),
                  Image.asset(p_imgsource, width: 80),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/Dice_$leftDice.png', width: 100),
                  SizedBox(width: 70.0),
                  Image.asset('assets/Dice_$rightDice.png', width: 100),
                ],
              ),
              Container(
                  padding:const EdgeInsets.only(top: 50),
                  child:Text(whoIsWin, style: TextStyle(fontSize: 30),)
              ),
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 170)),
                    ButtonTheme(
                      minWidth: 100,
                      height: 50,
                      child: ElevatedButton(
                          child: Text('replay!'),
                          onPressed: (){
                            setState(() {
                              leftDice = Random().nextInt(6) + 1;
                              rightDice = Random().nextInt(6) + 1;
                            });
                            //myToast('넙죽이 : $leftDice , 주인 : $rightDice ');
                          }),
                    ),
                    Padding(padding: EdgeInsets.only(right: 70)),
                    ButtonTheme(
                      minWidth: 100,
                      height: 20,
                      child: ElevatedButton(
                          child: Text('go back'),
                          onPressed: (){
                            Navigator.pop(context); //임마를 하면 화면 종료
                            //Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => first_page())); //버튼이 눌리는 이벤트 발생 시, 다음 페이지에서 전달 받을 string 변수와 value('SecondRoute_Delivered')값을 직접 전달
                          }),
                    ),
                  ]

              )


            ],
          ),
        ),
      );
    }
  }
}

// void myToast(String massage){
//   Fluttertoast.showToast(msg: massage,
//       backgroundColor: Colors.blue,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM
//   );
// }

////////////////////////////묵찌빠 페이지////////////////////////////
class RSPPage extends StatefulWidget {
  @override
  State<RSPPage> createState() => _RSPPage();
}

class _RSPPage extends State<RSPPage> {
  String n_imgsource ="";
  String p_imgsource ="";
  String whoIsWin ="";

  int leftRSP = 0;
  int rightRSP = 0;

  int RSP_case =0;  // 1 : 넘죽승, 2 : 넙죽패, 3 : 동점

  @override
  Widget build(BuildContext context) {


    if (RSP_case==1)  // 넙죽 승
        {
      n_imgsource='assets/happy.png';
      p_imgsource='assets/m_sad.png';
      whoIsWin='넙죽이 승리';
      setState(() {
        if (MYNUBJOOK.stress > 0) {
          MYNUBJOOK.stress = MYNUBJOOK.stress - 1;
        }
      });
    }
    else if (RSP_case==2) // 넙죽 패
        {
      n_imgsource='assets/sad.png';
      p_imgsource='assets/m_happy.png';
      whoIsWin='넙죽이 패배';
      setState(() {
        if (MYNUBJOOK.stress < 4) {
          MYNUBJOOK.stress = MYNUBJOOK.stress + 1;
        }
      });
    }
    else  // 동점
        {
      n_imgsource='assets/nj_icon.png';
      p_imgsource='assets/no_face.png';
      whoIsWin='동점';
    }

    ////////////////////////////titleSection////////////////////////////
    Widget titleSection = Container(  // 하나의 직사각형 생성
      padding: const EdgeInsets.only(top:20),  // 직사각형 위에 20만큼 padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
        children: [const Text('묵찌빠 게임', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))],
      ),
    );

    // 게임 시작 전
    if(rightRSP == 0)
    {
      n_imgsource='assets/nj_icon.png';
      p_imgsource='assets/no_face.png';

      whoIsWin=' ';
      return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              titleSection,
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(n_imgsource, width: 120),
                  SizedBox(width: 70.0),
                  Image.asset(p_imgsource, width: 80),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10.0),
                  Container(
                    decoration: BoxDecoration(  // container border 설정
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0) // POINT
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('choose one', style: TextStyle(fontSize: 23),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
                          children: [
                            IconButton(
                              icon: Image.asset('assets/RSP_1.png'),  // 나:묵
                              iconSize: 60,
                              onPressed: (){
                                setState(() {
                                  rightRSP = 1;
                                  leftRSP = Random().nextInt(3) + 1;
                                  if (leftRSP==1) RSP_case=3; // 넙죽:묵 --> 동점
                                  else if (leftRSP==2) RSP_case=2; // 넙죽:찌 --> 넙죽패
                                  else if (leftRSP==3) RSP_case=1; // 넙죽:빠 --> 넙죽승
                                });
                              },
                            ),
                            SizedBox(width: 30),
                            IconButton(
                              icon: Image.asset('assets/RSP_2.png'),  //나:찌
                              iconSize: 60,
                              onPressed: (){
                                setState(() {
                                  rightRSP = 2;
                                  leftRSP = Random().nextInt(3) + 1;
                                  if (leftRSP==1) RSP_case=1; // 넙죽:묵 --> 넙죽승
                                  else if (leftRSP==2) RSP_case=3; // 넙죽:찌 --> 동점
                                  else if (leftRSP==3) RSP_case=2; // 넙죽:빠 --> 넙죽패
                                });
                              },
                            ),
                            SizedBox(width: 30),
                            IconButton(
                              icon: Image.asset('assets/RSP_3.png'),  //나:빠
                              iconSize: 60,
                              onPressed: (){
                                setState(() {
                                  rightRSP = 3;
                                  leftRSP = Random().nextInt(3) + 1;
                                  if (leftRSP==1) RSP_case=2; // 넙죽:묵 --> 넙죽패
                                  else if (leftRSP==2) RSP_case=1; // 넙죽:찌 --> 넙죽승
                                  else if (leftRSP==3) RSP_case=3; // 넙죽:빠 --> 동점
                                });
                              },
                            ),
                          ],),
                      ],
                    ),

                  ),
                  SizedBox(width: 10.0),
                ],
              ),
              Container(
                //padding:const EdgeInsets.only(top: 50),
                child:Text(whoIsWin, style: TextStyle(fontSize: 30),),
              ),
              SizedBox(height: 40,),
              Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 300)),
                    ButtonTheme(
                      minWidth: 100,
                      height: 20,
                      child: ElevatedButton(
                          child: Text('go back'),
                          onPressed: (){
                            Navigator.pop(context); //임마를 하면 화면 종료
                            //Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => first_page())); //버튼이 눌리는 이벤트 발생 시, 다음 페이지에서 전달 받을 string 변수와 value('SecondRoute_Delivered')값을 직접 전달
                          }),
                    ),
                  ]
              )
            ],
          ),
        ),
      );
    }

    // 게임 시작 후
    else
    {
      return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              titleSection,
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(n_imgsource, width: 120),
                  SizedBox(width: 70.0),
                  Image.asset(p_imgsource, width: 80),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/n_RSP_$leftRSP.png', width: 100),
                  SizedBox(width: 70.0),
                  Image.asset('assets/RSP_$rightRSP.png', width: 100),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10.0),
                  Container(
                    decoration: BoxDecoration(  // container border 설정
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0) // POINT
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('choose one', style: TextStyle(fontSize: 23),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
                          children: [
                            IconButton(
                              icon: Image.asset('assets/RSP_1.png'),  // 나:묵
                              iconSize: 60,
                              onPressed: (){
                                setState(() {
                                  rightRSP = 1;
                                  leftRSP = Random().nextInt(3) + 1;
                                  if (leftRSP==1) RSP_case=3; // 넙죽:묵 --> 동점
                                  else if (leftRSP==2) RSP_case=2; // 넙죽:찌 --> 넙죽패
                                  else if (leftRSP==3) RSP_case=1; // 넙죽:빠 --> 넙죽승
                                });
                              },
                            ),
                            SizedBox(width: 30),
                            IconButton(
                              icon: Image.asset('assets/RSP_2.png'),  //나:찌
                              iconSize: 60,
                              onPressed: (){
                                setState(() {
                                  rightRSP = 2;
                                  leftRSP = Random().nextInt(3) + 1;
                                  if (leftRSP==1) RSP_case=1; // 넙죽:묵 --> 넙죽승
                                  else if (leftRSP==2) RSP_case=3; // 넙죽:찌 --> 동점
                                  else if (leftRSP==3) RSP_case=2; // 넙죽:빠 --> 넙죽패
                                });
                              },
                            ),
                            SizedBox(width: 30),
                            IconButton(
                              icon: Image.asset('assets/RSP_3.png'),  //나:빠
                              iconSize: 60,
                              onPressed: (){
                                setState(() {
                                  rightRSP = 3;
                                  leftRSP = Random().nextInt(3) + 1;
                                  if (leftRSP==1) RSP_case=2; // 넙죽:묵 --> 넙죽패
                                  else if (leftRSP==2) RSP_case=1; // 넙죽:찌 --> 넙죽승
                                  else if (leftRSP==3) RSP_case=3; // 넙죽:빠 --> 동점
                                });
                              },
                            ),
                          ],),
                      ],
                    ),

                  ),
                  SizedBox(width: 10.0),
                ],
              ),
              Container(
                //padding:const EdgeInsets.only(top: 50),
                child:Text(whoIsWin, style: TextStyle(fontSize: 30),),
              ),
              SizedBox(height: 40,),
              Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 300)),
                    ButtonTheme(
                      minWidth: 100,
                      height: 20,
                      child: ElevatedButton(
                          child: Text('go back'),
                          onPressed: (){
                            Navigator.pop(context); //임마를 하면 화면 종료
                            //Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => first_page())); //버튼이 눌리는 이벤트 발생 시, 다음 페이지에서 전달 받을 string 변수와 value('SecondRoute_Delivered')값을 직접 전달
                          }),
                    ),
                  ]
              )
            ],
          ),
        ),
      );
    }

  }
}

