import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final String label;
  final AssetImage iconAssetPath;
  final Function? onClick;

  ActionButtonWidget(
      {required this.label,
      required this.iconAssetPath,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 139.02,
      height: 139.02,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 139.02,
              height: 139.02,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0, // Điều chỉnh giá trị left cho vị trí của label
            top: 90, // Điều chỉnh giá trị top cho vị trí của label
            child: SizedBox(
              width: 140,
              height: 50,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF070821),
                  fontSize: 13,
                  fontFamily: 'Encode Sans',
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                  letterSpacing: 0.40,
                ),
              ),
            ),
          ),
          Positioned(
            left: 48, // Điều chỉnh giá trị left cho vị trí của biểu tượng
            top: 30, // Điều chỉnh giá trị top cho vị trí của biểu tượng
            child: Container(
              width: 80,
              height: 80,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: iconAssetPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
