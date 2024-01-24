import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String iconPath;
  final String text;
  final String routeName;

  const ProfileOption({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(
                iconPath,
                width: 24,
                height: 24,
              ),
              decoration: ShapeDecoration(
                color: Color(0xFFE4E3F2),
                shape: OvalBorder(),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Color(0xFF070821),
                      fontSize: 16,
                      fontFamily: 'Encode Sans',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: 0.16,
                    ),
                  ),
                  Image.asset('assets/icons/arrow.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
