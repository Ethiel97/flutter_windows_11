import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_windows_11/components/pile_faces.dart';

import '../constants.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isNotSm = _size.width >= screenSm;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: _isNotSm ? 24 : 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .3,
            color: darkColor.withOpacity(.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_isNotSm)
            const SizedBox(
              height: 18,
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: _isNotSm
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FlutterIcons.mic_mdi,
                    color: textColor.withOpacity(.4),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Icon(
                    FlutterIcons.videocam_mdi,
                    color: textColor.withOpacity(.4),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Icon(
                    FlutterIcons.controller_record_ent,
                    color: textColor.withOpacity(.4),
                  ),
                ],
              ),
              if (_isNotSm) ...[
                const SizedBox(
                  height: 35,
                  width: 200,
                  child: PileFaces(),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: accentColor, enableFeedback: true),
                  child: const Text(
                    "Share Screen",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}
