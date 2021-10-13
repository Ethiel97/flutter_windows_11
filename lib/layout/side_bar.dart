import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_windows_11/models/menu_item.dart';
import 'package:flutter_windows_11/widgets/side_bar_item.dart';
import 'package:flutter_windows_11/widgets/user_with_status.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

List topMenuItems = [
  MenuItem(
    null,
    "Search",
    FlutterIcons.search1_ant,
  ),
  MenuItem(
    null,
    "Notifications",
    FlutterIcons.bells_ant,
  ),
  MenuItem(
    null,
    "Cloud Sharing",
    FlutterIcons.cloudo_ant,
  ),
];

List secondaryMenuItems = [
  MenuItem(
    null,
    "Chat",
    FlutterIcons.message1_ant,
  ),
  MenuItem(
    null,
    "Meetings",
    FlutterIcons.adduser_ant,
  ),
  MenuItem(
    null,
    "Sessions",
    FlutterIcons.book_ant,
  ),
];

List onlineUsers = [
  MenuItem(
    "11.jpg",
    "Steven Jerry",
    null,
  ),
  MenuItem(
    "31.jpg",
    "Anna Mark",
    null,
  ),
  MenuItem(
    "51.jpg",
    "Alexina Penielle",
    null,
  ),
];

List bottomMenuItems = [
  MenuItem(
    null,
    "Dark Mode",
    FlutterIcons.light_bulb_ent,
  ),
  MenuItem(
    null,
    "Settings",
    FlutterIcons.setting_ant,
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
      height: _size.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          right: BorderSide(
            width: .3,
            color: darkColor.withOpacity(.2),
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
            mainAxisAlignment: _isDesktop
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (_isDesktop)
                Text(
                  "devEnthusiast",
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontFamily: GoogleFonts?.nunito().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const UserWithStatus(
                image: "me.jpg",
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ...topMenuItems
                    .map((e) => SideBarMenuItem(e, _isDesktop))
                    .toList(),
                const SizedBox(
                  height: 40,
                ),
                ...secondaryMenuItems
                    .map((e) => SideBarMenuItem(e, _isDesktop))
                    .toList(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "CONTENT MANAGERS",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: textColor.withOpacity(.4),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                ...onlineUsers
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
