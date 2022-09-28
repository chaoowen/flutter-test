import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'common.dart';
import './../main.dart';


// -----------------------------------------------------
class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  String oneDay = '';
  String dayRange = '';

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datetime Filter'),
        backgroundColor: Color.fromRGBO(214, 218, 88, 1),
      ),
      // ---------------------------------------------
      drawer: SlideBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  child: Text('choose one date'),
                  onPressed: () async {
                    final newOneDay = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020, 01),
                      lastDate: DateTime(2100, 12)
                    );
                    setState(() {
                      oneDay = newOneDay.toString().split(' ')[0];
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(oneDay == 'null' ? '' : oneDay),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  child: Text('choose date range'),
                  onPressed: () async {
                    final newRangeDay = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2020, 01),
                      lastDate: DateTime(2100, 12)
                    );
                    setState(() {
                      dayRange = newRangeDay.toString().split('00:00:00.000')[0] + newRangeDay.toString().split('00:00:00.000')[1] ;
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(214, 218, 88, 1)),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(dayRange == 'null' ? '' : dayRange),
                ),
              ],
            )
            
            
          ],
        ),
      ),
      
    );
        // -----------------------------------------
  }
}