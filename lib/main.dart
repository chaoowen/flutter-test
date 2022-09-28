import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'component/page1.dart';
import 'component/page2.dart';
import 'component/page3.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(pageNumber: 0),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(214, 218, 88, 1),
        scaffoldBackgroundColor: Color.fromRGBO(237, 242, 239, 1),
        primarySwatch: Colors.grey,
        // fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(52, 42, 33, 1),),
          headline2: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(52, 42, 33, 1),),
          headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(52, 42, 33, 1),),
          bodyText1: TextStyle(fontSize: 18.0, color: Color.fromRGBO(52, 42, 33, 1),),
          bodyText2: TextStyle(fontSize: 14.0, color: Color.fromRGBO(52, 42, 33, 1),),
        )
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  int pageNumber = 0;
  MyApp({ super.key, required this.pageNumber });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return home(index: pageNumber);
  }
}

class home extends State<MyApp>{
  home({ required this.index });
  int index = 0;
  final mainColor = Color.fromRGBO(214, 218, 88, 1);
  final greenColor = Color.fromRGBO(88, 135, 109, 1);
  List<Widget> pages = [
    IndexPage(),
    FormPage(),
    DateTimePage(),
    Container(color: Colors.limeAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -------------------------------
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar( 
        type: BottomNavigationBarType.fixed,  // 預設只會有被點擊的icon出現文字，用fixed讓所有文字出現
        currentIndex: index,
        onTap: (int idx) {
          // 在上方宣告idex
          setState(() {
            index = idx;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.accessibility_new_outlined, color: greenColor), backgroundColor: Colors.amberAccent, label: 'index'),
          BottomNavigationBarItem(icon: Icon(Icons.note_add_rounded, color: greenColor), backgroundColor: Colors.amberAccent, label: 'apply'),
          BottomNavigationBarItem(icon: Icon(Icons.handshake, color: greenColor), backgroundColor: Colors.amberAccent, label: 'three'),
          BottomNavigationBarItem(icon: Icon(Icons.safety_check_sharp, color: greenColor), backgroundColor: Colors.amberAccent, label: 'four')
        ]
      ),
    );
  }
}

