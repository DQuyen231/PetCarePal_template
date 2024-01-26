import 'package:flutter/material.dart';
import 'package:petcarepal/screens/calendar/components/info_card.dart';
import 'package:petcarepal/screens/calendar/components/table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7FA),
        title: Text(
          'Đặt lịch',
          style: TextStyle(
            color: Color(0xFF070821),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfoCard(),
            CustomTableCalendar(
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              selectedDay: _selectedDay,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 335,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút được nhấp vào
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4552CB),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Tạo lịch trình',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // In đậm chữ
                    fontSize: 16, // Phóng to kích thước chữ
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
