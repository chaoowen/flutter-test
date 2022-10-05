import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'common.dart';
import './../main.dart';
// table calender
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

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
      body: SingleChildScrollView(
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
            ),
            SizedBox(
              height: 40,
            ),
            const tableCalendar(),
          ],
        ),
      ),
    );
  }
}



class tableCalendar extends StatefulWidget {
  const tableCalendar({super.key});

  @override
  State<tableCalendar> createState() => _tableCalendarState();
}

class _tableCalendarState extends State<tableCalendar>  {
  DateTime _focusedDay = DateTime.now();
  DateTime ? _selectedDay;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('zh_CN', null);
    return Column(
      children: [
        Text("you have clicked: ${_selectedDay?.toString().split(' ')[0] ?? ''}"),
        SizedBox(height: 10,),
        TableCalendar(
          locale: 'zh_CN',
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          // calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
          // 自訂樣式
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,  // 不顯示button
            titleCentered: true,  // 置中
            titleTextStyle: TextStyle(
              color: Color.fromRGBO(82, 95, 127, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          // 星期的 style
          daysOfWeekStyle: const DaysOfWeekStyle(
            // weekdayStyle: TextStyle(fontSize: 14, color: Color.fromRGBO(82, 95, 127, 1)),
            weekendStyle: TextStyle(fontSize: 14, color: Color.fromRGBO(82, 95, 127, 1)),
          ),
          calendarStyle: const CalendarStyle(
            weekendTextStyle: TextStyle(color: Color.fromRGBO(82, 95, 127, 1)),
            // weekNumberTextStyle: TextStyle(fontSize: 16, color: Color.fromRGBO(82, 95, 127, 1)),
            todayDecoration: BoxDecoration(
              color: Color.fromRGBO(82, 95, 127, 1),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Color.fromRGBO(98, 119, 226, 1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
    
  }
}