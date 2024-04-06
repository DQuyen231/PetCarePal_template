import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/config/app_routes.dart'; // Import thư viện intl

Future<List<Member>> fetchMembers() async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/api/ThanhVienApp'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Member> memberList =
        data.map((json) => Member.fromJson(json)).toList();
    return memberList;
  } else {
    throw Exception('Failed to load orders');
  }
}

class Member {
  int id;
  DateTime batDau;
  DateTime ketThuc;
  dynamic user;
  int userId;

  Member({
    required this.id,
    required this.batDau,
    required this.ketThuc,
    required this.user,
    required this.userId,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        batDau: DateTime.parse(json["batDau"]),
        ketThuc: DateTime.parse(json["ketThuc"]),
        user: json["user"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batDau": batDau.toIso8601String(),
        "ketThuc": ketThuc.toIso8601String(),
        "user": user,
        "userId": userId,
      };
}

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  late Future<List<Member>> futureMembers;

  @override
  void initState() {
    super.initState();
    futureMembers = fetchMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách thành viên',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.admin);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: FutureBuilder<List<Member>>(
            future: futureMembers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      width: 400,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        'Tổng số thành viên: ${snapshot.data!.length}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final member = snapshot.data![index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'User ID: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      '${member.userId}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blue[800],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      'Ngày đăng ký: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      '${DateFormat('dd/MM/yyyy HH:mm').format(member.batDau)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      'Ngày kết thúc: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      '${DateFormat('dd/MM/yyyy HH:mm').format(member.ketThuc)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Text('No data');
              }
            },
          ),
        ),
      ),
    );
  }
}
