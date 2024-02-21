// circle_avatar_widget.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CircleAvatarWidget extends StatefulWidget {
  const CircleAvatarWidget({super.key});

  @override
  State<CircleAvatarWidget> createState() => _CircleAvatarWidgetState();
}

List<Pet> petFromJson(String str) =>
    List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String petToJson(List<Pet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  int id;
  String ten;
  int tinhTrang;
  int gioiTinh;
  int loai;
  DateTime ngaySinh;
  int userId;

  Pet({
    required this.id,
    required this.ten,
    required this.tinhTrang,
    required this.gioiTinh,
    required this.loai,
    required this.ngaySinh,
    required this.userId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        ten: json["ten"],
        tinhTrang: json["tinhTrang"],
        gioiTinh: json["gioiTinh"],
        loai: json["loai"],
        ngaySinh: DateTime.parse(json["ngaySinh"]),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ten": ten,
        "tinhTrang": tinhTrang,
        "gioiTinh": gioiTinh,
        "loai": loai,
        "ngaySinh": ngaySinh.toIso8601String(),
        "userId": userId,
      };
}

Future<Pet> fetchPet() async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/api/ThuCung/5'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> {
  late Future<Pet> futurePet;

  @override
  void initState() {
    super.initState();
    futurePet = fetchPet();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pet>(
      future: futurePet,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32.0,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(height: 4),
              Text(
                '${snapshot.data?.ten}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF070821),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${snapshot.data?.loai}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBBC3CE),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
