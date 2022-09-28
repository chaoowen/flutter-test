import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'common.dart';
import 'package:flutter/scheduler.dart';  // 設定 timeDilation 

// --------------------------------------------

class PhotoHero extends StatelessWidget {
  const PhotoHero({ required this.photo, required this.onTap, required this.width });

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class pokemonItem {
  String ? name;
  String ? description;
  String ? url;

  pokemonItem({this.name, this.description, this.url});
}

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    // var screenWidth = MediaQuery.of(context).size.width;
    final List<pokemonItem> itemList = [
      pokemonItem(
        name: '波克比 Pokobi',
        description: '殼內好像塞滿了許多幸福，據說只要溫柔地對待牠，牠就會把幸運分給對方。',
        url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-b2HSg3WI0DkxHQ8F-d6W5gQ8T-ZTXNf28Q&usqp=CAU',
      ),
      pokemonItem(
        name: '風速狗 Fonsugo',
        description: '只需要一晝夜時間就能跑完10000公里的身影令許多人為之沉醉。',
        url: 'https://assets.juksy.com/files/articles/53954/800x_100_w-61c2fa191595e.jpg',
      ),
      pokemonItem(
        name: '六尾 Luiway',
        description: '長年在阿羅拉地區萬年積雪的山上生活，使得六尾擁有了冰的能力。',
        url: 'https://a.rimg.com.tw/s2/b/93/bc/21701025217468_963.jpg',
      ),
      pokemonItem(
        name: '水君 Shuagin',
        description: '體內蘊藏著泉水般溫柔的寶可夢。會用滑行般的動作在大地上奔跑，有著淨化濁水的力量。',
        url: 'https://img.ttshow.tw/images/author/dean/02034-6.jpg',
      ),
      pokemonItem(
        name: '快龍 Kailong',
        description: '能輕描淡寫地飛越驚濤駭浪，目睹這個景象的船長稱呼牠為大海的化身。',
        url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGrj5ikzuzF7gnzUn8Y0Z5O-vnOHA_BRvgpuXrVowNlaWHlPe7-HTQZqqH18XBuBAf95Y&usqp=CAU',
      ),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
        backgroundColor: Color.fromRGBO(214, 218, 88, 1),
      ),
      // ---------------------------------------------
      drawer: SlideBar(context),
      // -----------------------------------------
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: itemList.length,
          gridDelegate: 
          // 不指定寬度，只限制行數，缺點:手機衡向時可能寬度過大
          // SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   childAspectRatio: 2/3
          // ), 
          // 指定元素寬度
          const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            childAspectRatio: 1
          ),
          itemBuilder: (context, idx) {
            return PhotoHero(
              photo: itemList[idx].url!,
              width: 200,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return pokemonItemPage(
                      name: itemList[idx].name!, 
                      url: itemList[idx].url!,
                      description: itemList[idx].description!,
                    );   
                  })
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class pokemonItemPage extends StatelessWidget {
  final String name;
  final String url;
  final String description;
  pokemonItemPage({ super.key, required this.name, required this.url, required this.description });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromRGBO(214, 218, 88, 1),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          PhotoHero(
            photo: url,
            width: 300.0,
            onTap: () {
              Navigator.of(context).pop(); 
            },
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              description,
              style: TextStyle(fontSize: 18, height: 1.5, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(88, 135, 109, 1),
    );
  }
}