// loading_screen.dart

import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  // Hàm giả lập việc tải dữ liệu
  Future<void> fetchData() async {
    // Giả lập việc tải dữ liệu
    await Future.delayed(Duration(seconds: 3));

    // Khi dữ liệu đã được tải xong, cập nhật trạng thái
    setState(() {
      isLoading = false;
    });

    await Future.delayed(Duration(seconds: 2));

    Navigator.pushNamed(context, AppRoutes.login);
  }

  @override
  void initState() {
    super.initState();
    // Bắt đầu tải dữ liệu khi widget được khởi tạo
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFF4552CB)),
      child: Stack(
        children: [
          Positioned(
            left: 225.39,
            top: 494.84,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.81),
              child: Container(
                width: 37.12,
                height: 36.63,
                child: Stack(children: [
                  Image.asset('assets/icons/icon.png'),
                ]),
              ),
            ),
          ),
          Positioned(
            left: 200.39,
            top: 422.84,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.81),
              child: Container(
                width: 37.12,
                height: 36.63,
                child: Stack(children: [
                  Image.asset('assets/icons/icon.png'),
                ]),
              ),
            ),
          ),
          Positioned(
            left: 258.08,
            top: 388.84,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.89),
              child: Container(
                width: 37.12,
                height: 36.63,
                child: Stack(children: [
                  Image.asset('assets/icons/icon.png'),
                ]),
              ),
            ),
          ),
          Positioned(
            left: 167.17,
            top: 519.33,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.89),
              child: Container(
                width: 37.12,
                height: 36.63,
                child: Stack(children: [
                  Image.asset('assets/icons/icon.png'),
                ]),
              ),
            ),
          ),
          Positioned(
            left: 200.58,
            top: 336.17,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.16),
              child: Container(
                width: 37.12,
                height: 36.63,
                child: Stack(children: [
                  Image.asset('assets/icons/icon.png'),
                ]),
              ),
            ),
          ),
          Positioned(
            left: 234.42,
            top: 283.90,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.21),
              child: Container(
                width: 37.12,
                height: 36.63,
                child: Stack(children: [
                  Image.asset('assets/icons/icon.png'),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
