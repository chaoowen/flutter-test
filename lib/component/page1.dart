import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'common.dart';
import './../main.dart';


// ----------------------------------------------------------
class IndexPage extends StatelessWidget {
  const IndexPage({super.key});
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(214, 218, 88, 1),
          // bottom: TabBar(
          //   tabs: myTabs.map((Tab tab) {
          //     return Tab(
          //       icon: tab.icon,
          //     );
          //   }).toList()
          // ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('Labor Information'),
        ),
        // -------------------------
        drawer: SlideBar(context),
        // -------------------------
        body: TabBarView(
          children: [
            IndexPage1(),
            IndexPage2(),
            IndexPage3(),
          ]
        ),
      )
    );
  }
}

// ----------------------------------------------------
class IndexPage1 extends StatelessWidget {
  const IndexPage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/mockey.jpg'),
          Container(
            margin: EdgeInsets.all(30.0),
            child: Text(
              'congrats ! you are a labor now !',
              style: TextStyle(color: Color.fromRGBO(88, 135, 109, 1), fontSize: 18,)
            ),
          ),
          SnackBarButton(
            context, 
            buttonName: 'click me!', 
            text: 'you have clicked',
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('hello visitor'),
                    content: Text('Here is the alert.'),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);  // 關掉 alert
                        },
                      ),
                      TextButton(
                        child: Text("next"),
                        onPressed: () {
                          Navigator.pop(context);  // 關掉 alert
                        },
                      ),
                    ],
                  );
                },
              );
            }, 
            child: Text('alert me!')
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,  // 外層高度依據column的最小高度
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,20,0,20),
                          child: Text('Agreement'),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "This is your honor to be here. Born as a human being and working hard everyday is the greatest thing you can have in your life. \nIsn't it?",
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,10,0,10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Agree'),
                              ),
                              ElevatedButton(
                                style:ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Disagree'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),          
                    
                  );
                },
              );
            }, 
            child: Text('dialog me!')
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------
class IndexPage2 extends StatefulWidget {
  const IndexPage2({super.key});

  @override
  State<IndexPage2> createState() => _IndexPage2State();
}

class _IndexPage2State extends State<IndexPage2> {
  final list = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, idx) {
        final item = list[idx];
        return Dismissible(
          key: Key(item),
          background: Container(color: Color.fromRGBO(88, 135, 109, 1)),
          onDismissed: (direction) {
            setState(() {
              list.removeAt(idx);
            });
            ScaffoldMessenger.of(context).showSnackBar(  //顯示Snackbar
              SnackBar(
                content: Text('you delete item $item'),
                duration: Duration(milliseconds: 500), // 預設四秒太久了
              ),
            );
          },
          child: ListTile(
            title: Text('this is item $item', textAlign: TextAlign.center,)
          ),
        );
      },
    );
  }
}

class favoriteItem {
  String ? name;
  String ? description;
  bool ? favorite;

  favoriteItem({this.name, this.description, this.favorite});
}

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => IndexPage3();
// }

class IndexPage3 extends StatefulWidget {
  @override
  State<IndexPage3> createState() => _IndexPage3State();
}

class _IndexPage3State extends State<IndexPage3> {
  final List<favoriteItem> itemList = [
    favoriteItem(
      name: 'Josha',
      description: 'good boy',
      favorite: false,
    ),
    favoriteItem(
      name: 'Howda',
      description: 'sweet smile',
      favorite: false,
    ),
    favoriteItem(
      name: 'Looky',
      description: 'fat body',
      favorite: true,
    ),
    favoriteItem(
      name: 'Looky',
      description: 'fat body',
      favorite: true,
    ),
    favoriteItem(
      name: 'Tiller',
      description: 'fluffy',
      favorite: false,
    ),
  ];

  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;   // 開啟 debug 格線工具

    return GridView.builder(
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
        // childAspectRatio: 2/3
      ),
      itemBuilder: (context, idx) {
        return Card(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS18HwSSC9BShLE4iI31i9AEuzVw36-l5Sunw&usqp=CAU',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Row(
                // mainAxisAlignment 控制 column & row 的排列方式
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB(0,0,0,0),
                    child: IconButton(
                      padding: EdgeInsets.all(4),
                      constraints: BoxConstraints(),  // 拿掉 IconButton 的 padding
                      icon: Icon(
                        Icons.favorite,
                        size: 24,
                        // using the index of listViewBuilder
                        color: itemList[idx].favorite! ? Colors.pink[200] : Colors.grey,
                      ),
                      tooltip: 'Add to Favorite',
                      onPressed: () {
                        setState(() {
                          itemList[idx].favorite = !itemList[idx].favorite!;
                        });
                      }),

                    // Icon(
                    //   Icons.favorite,
                    //   color: itemList[idx].favorite ? Colors.pink[200] : Colors.grey
                    // ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'name: ${itemList[idx].name}',
                          style: TextStyle(fontWeight: FontWeight.w700,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${itemList[idx].description}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}

