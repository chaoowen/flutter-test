import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './page5.dart';


// ----------------------------------------------------------
Container SnackBarButton(
  BuildContext context, 
  {required String buttonName, required String text}
) {
  return Container( 
    // margin: EdgeInsets.all(20.0),
    child:ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
      onPressed: () {
        final snackBar = SnackBar(
          // backgroundColor: Color.fromRGBO(88, 135, 109, 1),
          content: Text('${text}'),
          action: SnackBarAction(
            label: 'X',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text('${buttonName}'),
    )
  );
}
Drawer SlideBar(BuildContext context){
  return Drawer(
    backgroundColor: Colors.white,
    child: Column(
      // padding: const EdgeInsets.all(10.0),
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 110,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10),
                  // padding: EdgeInsets.all(0),
                  color: Color.fromRGBO(88, 135, 109, 1),
                  child: const Center(
                    child: Text(
                      'Welcome, labor X221',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                    
                ),
              ),
              
              ListTile(
                title: Text('personal information'),
                onTap: () {
                  Navigator.of(context).pop();   // 點擊後將 Drawer 關掉
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return new PersonalInformationPage(userNumber: 'X221');   
                    })
                  );
                },
              ),
              ListTile(
                title: Text('record'),
                onTap: () {
                  Navigator.pop(context);   // 點擊後將 Drawer 關掉
                },
              ),
            ],
          ),
        ),
        ListTile(
          title: Text('leave'),
          onTap: () {
            Navigator.pop(context);   // 點擊後將 Drawer 關掉
          },
        ),
        
      ],
    ),
  );   
}

