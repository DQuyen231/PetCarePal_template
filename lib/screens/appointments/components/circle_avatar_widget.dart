// circle_avatar_widget.dart
import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32.0,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        SizedBox(height: 4),
        Text(
          'Tommy',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF070821),
            fontSize: 13,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.13,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Golden Retriever',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFBBC3CE),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.24,
          ),
        ),
      ],
    );
  }
}
