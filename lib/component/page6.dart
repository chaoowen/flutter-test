import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'common.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// --------------------------------------------
Dio dio =  Dio();

// Future getApi() async {
//   var httpClient = new HttpClient();
//   var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//   var request = await httpClient.getUrl(uri);
//   var response = await request.close();
//   var data = await response.transform(utf8.decoder).join();
//   return await jsonDecode(data);
// }


class ApiListPage extends StatefulWidget {
  const ApiListPage({super.key});

  @override
  State<ApiListPage> createState() => _ApiListPageState();
}

class _ApiListPageState extends State<ApiListPage> {
  List articleList = [];

  Future getApi() async {
    // var option = Options(
    //   contentType: 'application/json;charset=UTF-8',
    //   responseType: ResponseType.plain,
    // );
    // dio.options.headers = { 'Content-Type': 'application/json;charset=UTF-8' };
    await dio.get('https://jsonplaceholder.typicode.com/posts')
      .then((res) {
        setState(() {
          // var data = res.data.toString();
          articleList = json.decode(json.encode(res.data));
          // articleList = json.decode(json.encode(res.data.toString()));
        });
      });

    http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
      .then((res) {
        setState(() {
          articleList = jsonDecode(res.body);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    getApi();
    return Scaffold(
      appBar: AppBar(
        title: Text('record'),
        backgroundColor: Color.fromRGBO(214, 218, 88, 1),
      ),
      body: 
      // Container(
      //   // child: Center(child: Text(articleList?[0].title ?? 'aaa' )),
      //   child: Center(child: Text('${articleList[0].title}')),
      // ),
      ListView.builder(
        itemCount: articleList.length,
        itemBuilder: (context, idx) {
          var data = articleList[idx];
          return ListTile(
            title: Text(data['title']),
            subtitle: Text(data['body']),
          );
        }
      )
    );
  }
}