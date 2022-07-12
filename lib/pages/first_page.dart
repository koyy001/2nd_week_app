import 'package:flutter/material.dart';
import 'package:raise_nubjook/module/nubjook.dart';

class first_page extends StatelessWidget
{
  const first_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp(
    );
  }
}

// stateless. 움직이지않음. MyApp. 세부적인거 구현.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    ////////////////////////////titleSection////////////////////////////
    Widget titleSection = Container(  // 하나의 직사각형 생성
      padding: const EdgeInsets.only(top:20),  // 직사각형 위에 20만큼 padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
        children: [const Text('넙죽이 키우기', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))],
      ),
    );


    ////////////////////////////levelSection////////////////////////////
    Widget levelSection = SizedBox(
      child : const calculate_level(),
    );

    // 큰 뼈대. 자잘한 eliment들을 어떻게 배치할지 여기서 구현한다.
    return MaterialApp(
      title: 'raise pet',
      home: Scaffold(
        body: ListView( // Column으로 하면 --> 높이 지정을 디바이스의 크기보다 크게 지정할시 화면잘림. 그러나 ListView는 안잘리고 scroll 가능
          children: [
            titleSection,
            levelSection
          ],
        ),
      ),
    );
  }
}


// StatefulWidget을 상속받는 FavoriteWidget
class calculate_level extends StatefulWidget {
  const calculate_level({super.key});
  @override
  State<calculate_level> createState() => _calculate_level();
}

int prev_final_level = MYNUBJOOK.level;
int prev_full_level = MYNUBJOOK.full;
int prev_smart_level = MYNUBJOOK.smart;
int prev_stress_level = MYNUBJOOK.stress;
int prev_sleep_level=0;
int sleep_level=0;

String imgsource ="";
String imgsource_full_bar ="";
String imgsource_happy_bar ="";
String imgsource_smart_bar ="";
String imgsource_stress_bar ="";
String imgsource_final_bar ="";
class _calculate_level extends State<calculate_level>
{
  void _full_plus()  // _isFavorited와 _favoriteCount에 대한 값 변경
  {
    setState(() // statefulWidget 에서 변경된 것을 매번 적용시켜주려면, setState라는 애를 실행시켜줘야함. --> 변경된 것 적용가능
    {
      if(MYNUBJOOK.full<4) MYNUBJOOK.full = MYNUBJOOK.full + 1;
    });
    Future.delayed(const Duration(seconds: 1), ()
    {
      setState(()
      {
        prev_full_level=MYNUBJOOK.full;
      });
    });
  }

  void _smart_plus()  // _isFavorited와 _favoriteCount에 대한 값 변경
  {
    setState(() // statefulWidget 에서 변경된 것을 매번 적용시켜주려면, setState라는 애를 실행시켜줘야함. --> 변경된 것 적용가능
    {
      if(MYNUBJOOK.smart<4) MYNUBJOOK.smart = MYNUBJOOK.smart + 1;
      //stress_level+=2;
      MYNUBJOOK.stress = MYNUBJOOK.stress + 1;
    });
    Future.delayed(const Duration(seconds: 1), ()
    {
      setState(()
      {
        prev_smart_level=MYNUBJOOK.smart;
      });
    });
  }

  void _sleep_plus()  // _isFavorited와 _favoriteCount에 대한 값 변경
  {
    setState(() // statefulWidget 에서 변경된 것을 매번 적용시켜주려면, setState라는 애를 실행시켜줘야함. --> 변경된 것 적용가능
    {
      sleep_level++;
    }
    );
    Future.delayed(const Duration(seconds: 2), ()
    {
      setState(()
      {
        if (MYNUBJOOK.stress>0) MYNUBJOOK.stress = MYNUBJOOK.stress - 1;
        if (MYNUBJOOK.full>0) MYNUBJOOK.full = MYNUBJOOK.full - 1;
        prev_stress_level=MYNUBJOOK.stress;
        prev_full_level=MYNUBJOOK.full;
      });
    });
    Future.delayed(const Duration(seconds: 4), ()
    {
      setState(()
      {
        sleep_level=prev_sleep_level;
      });
    });
  }

  void _Lv_plus()  // _isFavorited와 _favoriteCount에 대한 값 변경
  {
    setState(() // statefulWidget 에서 변경된 것을 매번 적용시켜주려면, setState라는 애를 실행시켜줘야함. --> 변경된 것 적용가능
    {
      MYNUBJOOK.level = MYNUBJOOK.level + 1;
      if (MYNUBJOOK.level<3)
        {
          MYNUBJOOK.full=0;
          prev_full_level=0;
          MYNUBJOOK.smart=0;
          prev_smart_level=0;
          MYNUBJOOK.stress=0;
          prev_stress_level=0;
        }
      else
        {
          imgsource = 'assets/2_graduate.png';
        }
    });
    if (MYNUBJOOK.level<3) {
      Future.delayed(const Duration(seconds: 1), ()
      {
        setState(()
        {
          prev_final_level=MYNUBJOOK.level;
        });
      });
    } else {
      Future.delayed(const Duration(seconds: 3), ()
      {
        setState(()
        {
          prev_final_level=MYNUBJOOK.level;
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if((MYNUBJOOK.full>=4)&&(MYNUBJOOK.smart>=4)&&(MYNUBJOOK.stress<4)) _Lv_plus();
    if (MYNUBJOOK.level==0)
    {
      if((MYNUBJOOK.full==0)&&(MYNUBJOOK.stress==0)&&(sleep_level==0)&&(MYNUBJOOK.smart==0)) imgsource = 'assets/0_start.gif';
      else if(MYNUBJOOK.stress>=4) imgsource = 'assets/0_stress.png';
      else if(prev_full_level!=MYNUBJOOK.full) imgsource = 'assets/0_full.png';
      else if(prev_sleep_level!=sleep_level) imgsource = 'assets/0_sleep.gif';
      else if(prev_smart_level!=MYNUBJOOK.smart) imgsource = 'assets/0_study.png';
      //else if(MYNUBJOOK.full<=0) imgsource = 'assets/0_hungry.png';
      else imgsource = 'assets/0_default.png';
    }
    else if (MYNUBJOOK.level==1)
    {
      if(prev_final_level!=MYNUBJOOK.level) imgsource = 'assets/1_start.gif';
      else if(MYNUBJOOK.stress>=4) imgsource = 'assets/1_stress.png';
      else if(prev_full_level!=MYNUBJOOK.full) imgsource = 'assets/1_full.png';
      else if(prev_sleep_level!=sleep_level) imgsource = 'assets/1_sleep.gif';
      else if(prev_smart_level!=MYNUBJOOK.smart) imgsource = 'assets/1_study.png';
      //else if(MYNUBJOOK.full<=0) imgsource = 'assets/1_hungry.png';
      else imgsource = 'assets/1_default.png';
    }
    else if (MYNUBJOOK.level==2)
    {
      if(prev_final_level!=MYNUBJOOK.level) imgsource = 'assets/2_start.gif';
      else if(MYNUBJOOK.stress>=4) imgsource = 'assets/2_stress.png';
      else if(prev_full_level!=MYNUBJOOK.full) imgsource = 'assets/2_full.png';
      else if(prev_sleep_level!=sleep_level) imgsource = 'assets/2_sleep.gif';
      else if(prev_smart_level!=MYNUBJOOK.smart) imgsource = 'assets/2_study.png';
      //else if(MYNUBJOOK.full<=0) imgsource = 'assets/2_hungry.png';
      else imgsource = 'assets/2_default.png';
    }

    if (MYNUBJOOK.full==0)
      imgsource_full_bar='assets/bar_0.png';
    else if (MYNUBJOOK.full==1)
      imgsource_full_bar='assets/bar_1.png';
    else if (MYNUBJOOK.full==2)
      imgsource_full_bar='assets/bar_2.png';
    else if (MYNUBJOOK.full==3)
      imgsource_full_bar='assets/bar_3.png';
    else if (MYNUBJOOK.full>=4)
      imgsource_full_bar='assets/bar_4.png';


    if (MYNUBJOOK.smart==0)
      imgsource_smart_bar='assets/bar_0.png';
    else if (MYNUBJOOK.smart==1)
      imgsource_smart_bar='assets/bar_1.png';
    else if (MYNUBJOOK.smart==2)
      imgsource_smart_bar='assets/bar_2.png';
    else if (MYNUBJOOK.smart==3)
      imgsource_smart_bar='assets/bar_3.png';
    else if (MYNUBJOOK.smart>=4)
      imgsource_smart_bar='assets/bar_4.png';


    if (MYNUBJOOK.stress==0)
      imgsource_stress_bar='assets/bar_0.png';
    else if (MYNUBJOOK.stress==1)
      imgsource_stress_bar='assets/red_bar_1.png';
    else if (MYNUBJOOK.stress==2)
      imgsource_stress_bar='assets/red_bar_2.png';
    else if (MYNUBJOOK.stress==3)
      imgsource_stress_bar='assets/red_bar_3.png';
    else if (MYNUBJOOK.stress>=4)
      imgsource_stress_bar='assets/red_bar_4.png';


    if (MYNUBJOOK.level==0)
      imgsource_final_bar='assets/level_bar_1.png';
    else if (MYNUBJOOK.level==1)
      imgsource_final_bar='assets/level_bar_2.png';
    else if (MYNUBJOOK.level==2)
      imgsource_final_bar='assets/level_bar_3.png';
    else if (MYNUBJOOK.level>=3)
      imgsource_final_bar='assets/level_bar_4.gif';


    if (MYNUBJOOK.stress>=4)
    {
      Future.delayed(const Duration(seconds: 4), ()
      {
        setState(()
        {
          MYNUBJOOK.level = 0;
          MYNUBJOOK.full=0;
          prev_full_level=0;
          MYNUBJOOK.smart=0;
          prev_smart_level=0;
          MYNUBJOOK.stress=0;
          prev_stress_level=0;
        });
      });
      return Column(
        children: [
          Container(child: Image.asset(imgsource, fit: BoxFit.cover)),
          Text('당신이 키운 넙죽이가 과도한 스트레스로 사망하였습니다.'),
          ButtonTheme(
            minWidth: 100,
            height: 20,
            child: ElevatedButton(
                child: Text('다시하기'),
                onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => first_page()));
                  // Navigator.pop(context);
                }),
          ),
        ],
      );
    }
    // else if (MYNUBJOOK.full<=0)
    // {
    //   Future.delayed(const Duration(seconds: 4), ()
    //   {
    //     setState(()
    //     {
    //       MYNUBJOOK.level = 0;
    //       MYNUBJOOK.full=0;
    //       prev_full_level=0;
    //       MYNUBJOOK.smart=0;
    //       prev_smart_level=0;
    //       MYNUBJOOK.stress=0;
    //       prev_stress_level=0;
    //     });
    //   });
    //   return Column(
    //     children: [
    //       Container(child: Image.asset(imgsource, fit: BoxFit.cover)),
    //       Text('당신은 넙죽이를 굶겼습니다.'),
    //       ButtonTheme(
    //         minWidth: 100,
    //         height: 20,
    //         child: ElevatedButton(
    //             child: Text('다시하기'),
    //             onPressed: (){
    //               // Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(builder: (context) => first_page()));
    //               // Navigator.pop(context);
    //             }),
    //       ),
    //     ],
    //   );
    // }
    else if (prev_final_level>=3)
    {
      Future.delayed(const Duration(seconds: 4), ()
      {
        setState(()
        {
          MYNUBJOOK.level = 0;
          MYNUBJOOK.full=0;
          prev_full_level=0;
          MYNUBJOOK.smart=0;
          prev_smart_level=0;
          MYNUBJOOK.stress=0;
          prev_stress_level=0;
        });
      });
      return Column(
        children: [
          Text('당신이 키운 넙죽이가 카이스트에 입학하였습니다!'),
          //Container(child: Image.asset('assets/3_graduate.png',width: 100, fit: BoxFit.cover) ),
          Container(child: Image.asset('assets/2_kaist.jpg', width: 350, fit: BoxFit.cover) )
        ],
      );
    }
    else
    {
      return Column(
        children: [
          Container(child: Image.asset(imgsource, width: 250, fit: BoxFit.cover)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 간격 띄워서, 중앙정렬
            children: [
              Column(children: [
                IconButton(
                  icon: Image.asset('assets/eat.png'),
                  iconSize: 60,
                  onPressed: _full_plus,
                ),
                Text('밥먹이기'),
              ],),
              Column(children: [
                IconButton(
                  icon: Image.asset('assets/study.png'),
                  iconSize: 60,
                  onPressed: _smart_plus,
                ),
                Text('공부하기')
              ],),
              Column(children: [
                IconButton(
                  icon: Image.asset('assets/sleep.png'),
                  iconSize: 60,
                  onPressed: _sleep_plus,
                ),
                Text('재우기')
              ],)
            ],),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, top:20),
                  child:
                  Column(
                    children: [
                      Row(children: const [
                        Text('배부름',style: TextStyle(fontSize: 18)),
                      ],),
                      SizedBox(height: 10),
                      Row(children: const [
                        Text('지성',style: TextStyle(fontSize: 18)),
                      ],),
                      SizedBox(height: 10),
                      Row(children: const [
                        Text('스트레스',style: TextStyle(fontSize: 18)),
                      ],),
                      SizedBox(height: 10),
                      Row(children: const [
                        Text('LV',style: TextStyle(fontSize: 18)),
                      ],)
                    ],)
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, top:15),
                  child:
                  Column(
                    children: [
                      Row(children: [
                        Row(
                          children: [
                            Container(
                              child:Image.asset(imgsource_full_bar, width: 250, fit: BoxFit.cover),
                              //padding: EdgeInsets.only(bottom:5)
                            ),
                            Text('${MYNUBJOOK.full*25}%',style: TextStyle(fontSize: 20))
                          ],)
                      ],),
                      Row(children: [Row(
                        children: [
                          Container(
                            child:Image.asset(imgsource_smart_bar, width: 250, fit: BoxFit.cover),
                            //padding: EdgeInsets.only(bottom:5)
                          ),
                          Text('${MYNUBJOOK.smart*25}%',style: TextStyle(fontSize: 20))
                        ],)
                      ],),
                      Row(children: [Row(
                        children: [
                          Container(
                            child:Image.asset(imgsource_stress_bar, width: 250, fit: BoxFit.cover),
                            //padding: EdgeInsets.only(bottom:5)
                          ),
                          Text('${MYNUBJOOK.stress*25}%',style: TextStyle(fontSize: 20))
                        ],)
                      ],),
                      Row(children: [Row(
                        children: [
                          Container(
                            child:Image.asset(imgsource_final_bar, width: 250, fit: BoxFit.cover),
                            //padding: EdgeInsets.only(bottom:5)
                          ),
                          Text('${MYNUBJOOK.level}',style: TextStyle(fontSize: 20))
                        ],)
                      ],)
                    ],)
              ),
            ],)
          //if(MYNUBJOOK.stress>=4) {

          //}
        ],
      );
    }
  }
}

