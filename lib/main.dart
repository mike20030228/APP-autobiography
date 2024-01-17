import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    const screen1(),
    const screen2(),
    const screen3(),
    const screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: const Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/f1.jpg',width:40,height:40): Image.asset('images/f1.jpg',width:20,height:20), label:'自我介紹',),
            const BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            const BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            const BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我出生在高雄市，成長於一個平凡的家庭。父親是工廠員工，母親是家庭主婦；因為母親是中國人且父親在中國工作，因此我童年時期是在中國度過的，在那邊生活的經驗對現在的我來說是一段令人印象深刻的回憶。
小學時，我對知識的渴望讓我成為一個積極學習的學生。老師的指導和家人的鼓勵讓我在學業上取得了穩步的進步。我開始參與學校的各項活動，培養了與同學相處的能力。
初中階段，我開始對自己的興趣進行更深入的探索。我對理科表現了興趣，這使我在對於未來的選擇上有了較為明確的方向。同時，我也積極參與班級幹部，不但服務他人也結交了人脈，培養了交流力和協作能力。
進入高職，我開始認真思考未來的職業方向。通過參與職業講座和實習，我逐漸確定了自己對資工的興趣。在學業上，我投入更多時間學習相關的知識，為進入大學做好準備。
大學入學後，我迎來了全新的學習環境和挑戰。在這個階段，我積極參與各種課外活動，拓展自己的社交圈子，並積極參與學術研究和實習機會。大學生活豐富多彩，我努力平衡學業和社交，培養全面發展的能力。 ';

  const screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('C110151165 江明瑜 Introduction', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            height: 200,
            width: 200,
            child:Image.asset('images/f1.jpg'),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  const screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1.基本資料:高科大 資訊工程系　C110151143 江明瑜'),
            Text('2.學習成果:學期成績基本位於班上前20%'),
            Text('3.經歷:在社團曾擔任文書職位'),
          ],
        ),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  const screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height:200,
              width: 200,
              child: ListView(
                children: const [
                  Text('1. 學好英文'),
                  Text('2. 組合語言'),
                  Text('3. 考取駕照'),
                  Text('4. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height:200,
              width: 200,
              child: ListView(
                children: const [
                  Text('1. 學習技能'),
                  Text('2. 學習程式'),
                  Text('3. 了解師長'),
                  Text('4. 規劃未來'),
                ],
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height:200,
              width: 200,
              child: ListView(
                children: const [
                  Text('1. 考取多益門檻'),
                  Text('2. 專題製作'),
                  Text('3. 實習資訊收集'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  const screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('學習專業'),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height:200,
              width: 200,
              child: ListView(
                children: const [
                  Text('1. C++'),
                  Text('2. Java'),
                  Text('3. html/php'),
                  Text('4. MySQL'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}