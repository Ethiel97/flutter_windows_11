import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_windows_11/models/menu_item.dart';
import 'package:flutter_windows_11/widgets/side_bar_item.dart';
import 'package:flutter_windows_11/widgets/user_with_status.dart';

import '../constants.dart';

List topMenuItems = [
  MenuItem(
    "Search",
    FlutterIcons.search1_ant,
  ),
  MenuItem(
    "Notifications",
    FlutterIcons.bells_ant,
  ),
  MenuItem("Cloud Sharing", FlutterIcons.cloud_ant),
];

List secondaryMenuItems = [
  MenuItem(
    "Chat",
    FlutterIcons.message1_ant,
  ),
  MenuItem(
    "Meetings",
    FlutterIcons.eye_ant,
  ),
  MenuItem(
    "Sessions",
    FlutterIcons.enviroment_ant,
  ),
];

List bottomMenuItems = [
  MenuItem(
    "Dark Mode",
    FlutterIcons.light_bulb_ent,
  ),
  MenuItem(
    "Settings",
    FlutterIcons.eye_ant,
  ),
];

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isDesktop = _size.width >= screenLg;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          right: BorderSide(
            width: .8,
            color: darkColor.withOpacity(.8),
          ),
        ),
      ),
      width: _isDesktop ? sideBarDesktopWidth : sideBarMobileWidth,
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: _isDesktop ? 24 : 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "devEnthusiast",
                style: TextStyle(
                  color: darkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const UserWithStatus(
            image: "me.jpg",
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...topMenuItems
                    .map((e) => SideBarMenuItem(e, _isDesktop))
                    .toList(),
                const SizedBox(
                  height: 80,
                ),
                ...secondaryMenuItems
                    .map((e) => SideBarMenuItem(e, _isDesktop))
                    .toList(),
                const Spacer(),
                ...bottomMenuItems
                    .map((e) => SideBarMenuItem(e, _isDesktop))
                    .toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
