import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'common.dart';
import './../main.dart';
import './page1.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonalInformationPage extends StatelessWidget {
  // const PersonalInformationPage({super.key});
  String userNumber = '';
  PersonalInformationPage({super.key, required this.userNumber});

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('personal information'),
        backgroundColor: Color.fromRGBO(214, 218, 88, 1),
      ),
      body: SizedBox.expand(child: 
        Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children:[
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(bottom: 40),
                child: 
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, // transparent_image 提供的圖
                  fadeInDuration: const Duration(seconds: 1),
                  image: 'https://i.imgur.com/P88WwLx.png',
                  fit: BoxFit.cover,
                ),
                // Image.network(
                //   'https://i.imgur.com/P88WwLx.png',
                //   fit: BoxFit.cover,
                // ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom:12),
                child: Text(
                  'name : Liber Junior', 
                  style: TextStyle(fontSize: 16,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:12),
                child: Text(
                  'no : $userNumber',
                  style: TextStyle(fontSize: 16,),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return MyApp(pageNumber:1);   
                    })
                  );
                }, 
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
                child: Text('apply job'),
              )
            ],
          ),
        ),
      ),
    );
  }
}