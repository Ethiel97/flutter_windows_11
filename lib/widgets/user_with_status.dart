import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';

class UserWithStatus extends StatelessWidget {
  final String image;
  final double width;

  const UserWithStatus({
    Key? key,
    required this.image,
    this.width = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: width,
            height: width,
            child: Image.asset(
              "assets/images/${image}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: -5,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: accentColor,
              border: Border.all(
                color: backgroundColor,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
