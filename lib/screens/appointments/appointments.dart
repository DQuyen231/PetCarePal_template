import 'package:flutter/material.dart';
import 'package:petcarepal/screens/appointments/components/upcoming_tab.dart';
import 'package:petcarepal/screens/appointments/components/done_tab.dart';

class UpcomingAppointmentsPage extends StatelessWidget {
  const UpcomingAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: 20), // Adjust the horizontal padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xFF4552CB),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sắp tới',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Đã làm',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: Text(
              'Đặt lịch',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            iconTheme: IconThemeData(color: Color(0xFF4552CB)),
          ),
          body: TabBarView(
            children: [
              UpcomingTab(),
              DoneTab(),
            ],
          ),
        ),
      ),
    );
  }
}
