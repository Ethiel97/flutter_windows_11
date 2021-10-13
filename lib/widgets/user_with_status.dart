import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';

class UserWithStatus extends StatelessWidget {
  final String image;
  final double size;

  const UserWithStatus({
    Key? key,
    required this.image,
    this.size = 38,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: size,
            height: size,
            child: Image.asset(
              "assets/images/$image",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: -2,
          child: Container(
            width: 8,
            height: 8,
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
