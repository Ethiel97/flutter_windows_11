import 'package:flutter/material.dart';
import 'package:flutter_windows_11/models/video_item.dart';
import 'package:flutter_windows_11/models/menu_item.dart';
import 'package:flutter_windows_11/widgets/video_item_view.dart';
import 'package:flutter_windows_11/widgets/side_bar_item.dart';
import 'package:flutter_windows_11/widgets/user_item.dart';

import '../constants.dart';

List videos = [
  VideoItem(
    "1.jpeg",
    const UserItem(image: "98.jpg", name: "John Farrel"),
    "31:40",
  ),
  VideoItem(
    "2.jpeg",
    const UserItem(
      image: "51.jpg",
      name: "Anna Marc",
    ),
    "52:10",
  ),
  VideoItem(
    "3.jpeg",
    const UserItem(
      image: "11.jpg",
      name: "Steven Jerry",
    ),
    "8:24",
  ),
  VideoItem(
    "4.jpeg",
    const UserItem(
      image: "31.jpg",
      name: "Lawson Doe",
    ),
    "29:20",
  ),
  VideoItem(
    "5.jpeg",
    const UserItem(
      image: "54.jpg",
      name: "Ray James",
    ),
    "17:16",
  ),
];

class VideosList extends StatefulWidget {
  const VideosList({Key? key}) : super(key: key);

  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isSm = _size.width <= screenSm;
    final bool _isLg = _size.width <= screenLg;

    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _isSm ? 1 : (_isLg ? 2 : 3),
        childAspectRatio: 1.25,
      ),
      itemBuilder: (context, index) => VideoItemView(
        item: videos[index],
      ),
    );
  }
}
