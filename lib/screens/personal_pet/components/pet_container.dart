import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetContainer extends StatefulWidget {
  const PetContainer({Key? key}) : super(key: key);

  @override
  State<PetContainer> createState() => _PetContainerState();
}

class _PetContainerState extends State<PetContainer> {
  late Future<List<Pet>> futurePets;

  @override
  void initState() {
    super.initState();
    futurePets = _initializeUserPets();
  }

  Future<List<Pet>> _initializeUserPets() async {
    try {
      final userId = await getUserIDFromLocalStorage();
      return getPetsByUserId(userId);
    } catch (error) {
      print('Error initializing user pets: $error');
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.9;

    return FutureBuilder<List<Pet>>(
      future: futurePets,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: snapshot.data!.map((pet) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10.0),
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Image(
                          image: AssetImage('assets/images/avatar.png'),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${pet.ten}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Golden Retriever',
                      style: TextStyle(
                        color: Color.fromARGB(218, 166, 180, 248),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Color(0xFF4552CB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.pet_chart);
                        },
                        child: Text(
                          'Hồ sơ bệnh án',
                          style: TextStyle(
                            color: Color.fromARGB(226, 255, 255, 255),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Future<int> getUserIDFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userID = prefs.getInt('userId');
  if (userID != null) {
    return userID;
  } else {
    throw Exception('UserID not found in localStorage');
  }
}

Future<List<Pet>> getPetsByUserId(int userId) async {
  final response = await http
      .get(Uri.parse('https://54.206.249.179/api/ThuCung/thucungs/$userId'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Pet> petList = data.map((json) => Pet.fromJson(json)).toList();
    return petList;
  } else {
    throw Exception('Failed to load pets');
  }
}

class Pet {
  final int id;
  final String ten;
  final int tinhTrang;
  final int gioiTinh;
  final int loai;
  final DateTime ngaySinh;
  final int userId;
  final dynamic user;

  Pet({
    required this.id,
    required this.ten,
    required this.tinhTrang,
    required this.gioiTinh,
    required this.loai,
    required this.ngaySinh,
    required this.userId,
    required this.user,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        ten: json["ten"],
        tinhTrang: json["tinhTrang"],
        gioiTinh: json["gioiTinh"],
        loai: json["loai"],
        ngaySinh: DateTime.parse(json["ngaySinh"]),
        userId: json["userId"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ten": ten,
        "tinhTrang": tinhTrang,
        "gioiTinh": gioiTinh,
        "loai": loai,
        "ngaySinh": ngaySinh.toIso8601String(),
        "userId": userId,
        "user": user,
      };
}
