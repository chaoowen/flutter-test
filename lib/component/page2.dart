import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'common.dart';
import './../main.dart';


// -----------------------------------------------------
class checkboxNationClass {
  bool ? Japan;
  bool ? Taiwan;
  bool ? Australia;

  checkboxNationClass({this.Japan, this.Taiwan, this.Australia});
}

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

final List<String> selectList = ['20-29', '30-39', '40-49', '50-59'];
final List<String> selectTimeList = ['0','1','2','3','4','5'];
final List<String> speciesCharacter = [ 'human', 'alien', 'animal', 'eternal' ];

class _FormPageState extends State<FormPage> {
  // FormPage({super.key});
  final formKey = GlobalKey<FormState>();
  final formController = TextEditingController();
  String formName = '';
  String formNickName = '';
  final checkboxNation = checkboxNationClass(
    Japan: false,
    Taiwan: false,
    Australia: false,
  );
  String selectValue = selectList.first;
  String selectTimeValue = selectTimeList.first;
  String radioValue = speciesCharacter.first;

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;   // 開啟 debug 格線工具
    initState() {
      print(checkboxNation);
    };
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Apply For More Job'),
          backgroundColor: Color.fromRGBO(214, 218, 88, 1),
        ),
        // ---------------------------------------------
        drawer: SlideBar(context),
        // -----------------------------------------
        body: SingleChildScrollView( child:
          Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: TextFormField(
                    // controller: formController,
                    onSaved: (String ? value){
                      formName = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'required';
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person, 
                        color: Color.fromRGBO(88, 135, 109, 1),
                      ),
                      labelText: 'name',
                      // suffixIcon: Icon(Icons.close), // icon 一直出現在右邊
                      // suffix: Icon(Icons.adb), // icon 在 input focus 才出現
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(88, 135, 109, 1)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: TextFormField(
                    onSaved: (String ? value){
                      formNickName = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'required';
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person, 
                        color: Color.fromRGBO(88, 135, 109, 1),
                      ),
                      labelText: 'nick name',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(88, 135, 109, 1)),
                      ),
                    ),
                  ),
                ),
                // checkbox --------------------------------------------
                FormField(
                  validator: (value) {
                    if (checkboxNation.Taiwan == false && checkboxNation.Japan == false && checkboxNation.Australia == false) {
                      // 錯誤訊息會丟至 state.errorText，要用一個 Text 組件去接
                      return 'please choose at least one';
                    };
                    return null;
                  },
                  builder: (state) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(16,16,16,16),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Where do you want to work ?'),
                          Row(
                            children: [
                              Checkbox(
                                value: checkboxNation.Taiwan, 
                                onChanged: (value) {
                                  setState(() {
                                    checkboxNation.Taiwan = !checkboxNation.Taiwan!;
                                    // state.didChange(value);
                                  });
                                },
                                activeColor: Color.fromRGBO(88, 135, 109, 1),
                                fillColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(88, 135, 109, 1)),
                              ),
                              Text('Taiwan'),
                              Checkbox(
                                value: checkboxNation.Japan, 
                                onChanged: (value) {
                                  setState(() {
                                    checkboxNation.Japan = !checkboxNation.Japan!;
                                    // state.didChange(value);
                                  });
                                },
                                activeColor: Color.fromRGBO(88, 135, 109, 1),
                                fillColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(88, 135, 109, 1)),
                              ),
                              Text('Japan'),
                              Checkbox(
                                value: checkboxNation.Australia, 
                                onChanged: (value) {
                                  setState(() {
                                    checkboxNation.Australia = !checkboxNation.Australia!;
                                    // state.didChange(value);
                                  });
                                },
                                activeColor: Color.fromRGBO(88, 135, 109, 1),
                                fillColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(88, 135, 109, 1)),
                              ),
                              Text('Australia'),
                            ],
                          ),
                          // 顯示錯誤訊息
                          Text(
                            state.errorText ?? '',
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // radio --------------------------------------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16,0,16,0),
                      child: Text("What's your species ?"),
                    ),
                    Column(
                      children: 
                        speciesCharacter.map<ListTile>((String value) {
                          return ListTile(
                            title: Text(value),
                            leading: Radio(
                              value: value,
                              groupValue: radioValue,
                              onChanged: (val) {
                                setState(() {
                                  radioValue = val!;
                                });
                              },
                              activeColor: Color.fromRGBO(88, 135, 109, 1),
                              fillColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(88, 135, 109, 1)),
                            ),
                          );
                        }).toList(),
                    )
                  ],
                ),
                // select -------------------------------------------
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16,0,16,0),
                      child: Text('age range'),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 16),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.fromLTRB(12,0,12,0),
                        ),
                        value: selectValue,
                        isExpanded: true,    // 文字過長時不會縮寫
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (value) {
                          setState(() {
                            selectValue = value!;
                          });
                        },
                        items: selectList.map<DropdownMenuItem>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),             
                    ),
                  ],
                ),
                
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16,0,16,0),
                      child: Text('work experiences'),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: DropdownButton<String>(
                        value: selectTimeValue,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String ? value) {
                          setState(() {
                            selectTimeValue = value!;
                            print(selectTimeValue);
                          });
                        },
                        items: selectTimeList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                // submit button ----------------------------------
                SizedBox( height: 30,),
                Center(
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                ' name: $formName\n nick name: $formNickName\n age: $selectValue\n experiences: $selectTimeValue'
                              ),
                            );
                          },
                        ).then((val) {
                          formKey.currentState?.reset();
                          setState(() {
                            checkboxNation.Japan = false;
                            checkboxNation.Taiwan = false;
                            checkboxNation.Australia = false;
                            selectValue = selectList.first;
                            selectTimeValue = selectTimeList.first;
                          });
                        });
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
                SizedBox( height: 50,),
              ],
            )
          ),
        ),
      ),
    );
  }
}