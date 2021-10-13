import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/models/video_item.dart';
import 'package:flutter_windows_11/widgets/side_bar_item.dart';

import 'user_with_status.dart';

class VideoItemView extends StatelessWidget {
  final VideoItem item;

  const VideoItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            // height: 120,
            // width: 120,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/${item.backgroundImage}",
                ),
                colorFilter: ColorFilter.mode(
                  darkColor.withOpacity(.35),
                  BlendMode.srcATop,
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  color: darkColor.withOpacity(.12),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 18,
            right: 16,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item.item,
                Text(
                  item.duration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
