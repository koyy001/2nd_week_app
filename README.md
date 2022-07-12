# raising_game_demo
2022 Summer MadCamp Week2 

## Project name
넙죽이 키우기 게임

## Teammates
POSTECH 컴퓨터공학과 박정은

DIGIST 기초학부 박병현

## Environment
OS : Android, iOS

Language : Dart

IDE : Android Studio

Target Device : Galaxy S10

Framework : Flutter

Backend: Node.js + express

Database: MySQL

## Description
이 앱은 카이스트의 대표 마스코트인 넙죽이를 키우는 게임이다. 행동의 선택에 따라 넙죽이를 키우는데 성공할 수도, 실패할 수도 있다.

## Implementation Method
1. 탭 전환 – navigator의 push, pop을 이용한 route간의 화면전환

2. data 저장 및 전달
  * data 전달 : http 프로토콜을 통해 client와 server 통신
  * data 저장 : [user_id, user_pw, new_user, _name, _full, _smart, _stress, _level] 정보 저장

## Usage
### tab1 – login page                   

|첫 화면|회원가입 화면|이름생성 화면|
|---|---|---|
|![KakaoTalk_20220712_200941007_01](https://user-images.githubusercontent.com/91946706/178479150-4b1846f9-6864-445f-9408-9048a335d746.jpg)|![KakaoTalk_20220712_200941007_03](https://user-images.githubusercontent.com/91946706/178479393-5d21871d-bbac-4ed0-90ef-0765366009bc.jpg)|![KakaoTalk_20220712_200941007_04](https://user-images.githubusercontent.com/91946706/178479236-2639e61a-ea81-47cf-8c9b-e9e7c0898ccd.jpg)|

* 계정이 등록되어있지 않은 경우 : 회원가입을 통해 새 계정을 등록할 수 있고, 이때 키울 넙죽이의 이름을 정할 수 있다. 이미 가입된 회원은 새로운 회원가입이 불가능하다.
* 계정이 등록되어 있는 경우 : 로그인을 통해 해당 계정의 데이터들에 접근할 수 있다. 이때 비밀번호나 아이디가 틀리면 접근하지 못한다.

### tab2.1 – 넙죽이 키우기 page                   

|첫 화면|밥먹기|공부하기|잠자기|
|---|---|---|---|
|![KakaoTalk_20220712_200941007_05](https://user-images.githubusercontent.com/91946706/178479450-6f6ad06d-9104-4be8-9e46-5021fabaeb4d.jpg)|![KakaoTalk_20220712_200941007_07](https://user-images.githubusercontent.com/91946706/178479500-f8b345c1-3534-4280-bffb-38032ebff9d2.jpg)|![KakaoTalk_20220712_200941007_08](https://user-images.githubusercontent.com/91946706/178479543-ee3747c7-49be-4cc1-acbb-705429610b8f.jpg)|![KakaoTalk_20220712_200941007_09](https://user-images.githubusercontent.com/91946706/178479562-9af4b74e-7ff7-472e-903b-c6cacd1fde96.jpg)|

|1 lv|2 lv|3 lv|
|---|---|---|
|![KakaoTalk_20220712_200941007_05](https://user-images.githubusercontent.com/91946706/178479593-db57ec18-28bb-4379-9a24-966bf6f478df.jpg)|![KakaoTalk_20220712_200941007_10](https://user-images.githubusercontent.com/91946706/178479656-f191605e-4e61-473c-86c9-cef599cf5a09.jpg)|![KakaoTalk_20220712_200941007_11](https://user-images.githubusercontent.com/91946706/178479699-65a93c4e-6c6c-46cc-aff7-2bcf9689b4b1.jpg)|

|키우기 실패 1|키우기 실패 2|키우기 실패 3|키우기 성공|
|---|---|---|---|
|![KakaoTalk_20220712_200941007_14](https://user-images.githubusercontent.com/91946706/178481418-b23db17a-ef79-4af4-90c5-3112842721f7.jpg)|![KakaoTalk_20220712_200941007_15](https://user-images.githubusercontent.com/91946706/178481456-28a1b829-abd3-4baf-a04f-40df2cabd69c.jpg)|![KakaoTalk_20220712_200941007_16](https://user-images.githubusercontent.com/91946706/178479778-05433131-bae3-4bf0-967d-a527232d8fd2.jpg)|![KakaoTalk_20220712_200941007_13](https://user-images.githubusercontent.com/91946706/178479735-8fa99655-40bf-43df-9acb-6455af946a55.jpg)|

넙죽이의 성장레벨은 총 3단계로, 모든 레벨을 달성하면 직접 키운 넙죽이가 카이스트에 입학하는 결말을 볼 수 있다.
* 넙죽이의 성장에 영향을 끼치는 요소 : 배부름, 지성, 스트레스        
  배부름과 지성이 충분해야 성장할 수 있고, 만약 스트레스를 많이 받으면 죽는다. 
* 넙죽이가 선택할 수 있는 행동 : 밥먹기, 공부하기, 잠자기              
  밥을 먹으면 배부름이 높아지고, 공부를 하면 스트레스와 지성이 함께 높아지며, 잠을 자면 스트레스와 배부름이 낮아진다.

### tab2.2 – mini game page                   

|첫 화면|주사위 게임|묵찌빠 게임|
|---|---|---|
|![KakaoTalk_20220712_200941007_17](https://user-images.githubusercontent.com/91946706/178479899-719e85c3-0a11-480e-8372-843b42e0d06f.jpg)|![KakaoTalk_20220712_200941007_18](https://user-images.githubusercontent.com/91946706/178479978-73fe9ec2-fec4-4632-be3b-7fd6673eff09.jpg)|![KakaoTalk_20220712_200941007_20](https://user-images.githubusercontent.com/91946706/178480021-8bec87f3-a79b-4ebc-8a9e-a38335d76088.jpg)|
|![KakaoTalk_20220712_200941007_17](https://user-images.githubusercontent.com/91946706/178479899-719e85c3-0a11-480e-8372-843b42e0d06f.jpg)|![KakaoTalk_20220712_200941007_19](https://user-images.githubusercontent.com/91946706/178480044-71381f8e-847d-4ef2-9e3c-3723e684cb09.jpg)|![KakaoTalk_20220712_200941007_21](https://user-images.githubusercontent.com/91946706/178480084-ab08e480-c957-4335-8c5e-1f93b88beb25.jpg)|

이 페이지엔 주사위게임, 묵찌빠게임 이렇게 두가지 게임이 있다.                          
만약 넙죽이가 지면 넙죽이의 스트레스 지수가 높아지고, 넙죽이가 이기면 스트레스 지수가 낮아진다.                           
이 페이지에서 변경된 스트레스 지수 데이터는 tab2.1로 전달되어 반영된다.                          
* 주사위게임 : 넙죽이와 주인 둘다 주사위를 돌리는데, 숫자가 큰 쪽이 이긴다. 
* 묵찌빠게임 : 넙죽이의 묵찌빠는 랜덤으로, 주인의 묵찌빠는 선택으로 정해진다. 

### tab2.3 – setting page                   

|첫 화면|
|---|
|![KakaoTalk_20220712_200941007](https://user-images.githubusercontent.com/91946706/178478921-9e61cb12-248f-4aa7-89ff-2513a365f4e5.jpg)|

이 페이지에선 저장하기, logout의 기능을 구현하였다. 
* 저장하기 버튼 : 현재 넙죽이의 상태 및 레벨, 이름에 대한 data들을 서버에 저장하여, 다시 log in하면 저장된 data들을 불러오도록 구현하였다.
* Logout 버튼 : 현재 계정을 log out 시킬 수 있다.

## What to supplement later
넙죽이가 죽는 경우를 더 늘리고 죽는 이유를 더 다양하게 만든다면 게임에 대한 몰입도와 재미가 더 높아질 것 같다. 

또한, 죽을 때마다 넙죽이가 죽은 이유에 대한 화면이 캡쳐되어서 넙죽이 사망원인 도감에 수집할 수 있다면 흥미가 더 높아질 것 같다.
