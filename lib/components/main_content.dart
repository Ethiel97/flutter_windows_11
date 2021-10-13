import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/providers/menu_item_provider.dart';
import 'package:provider/provider.dart';

import 'videos_list.dart';

class MainContent extends StatefulWidget {
  MainContent({Key? key}) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isNotSm = _size.width >= screenSm;

    return Consumer<MenuItemProvider>(
      builder: (context, provider, child) {
        return Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: _isNotSm
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.08),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            provider.menuItem?.icon,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          provider.menuItem?.label ?? "Home",
                          style: const TextStyle(
                              color: textColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    if (_isNotSm) ...[
                      const Icon(
                        FlutterIcons.grid_ent,
                        color: textColor,
                        size: 24,
                      )
                    ],
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const VideosList(),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 2,
              child: FloatingActionButton(
                backgroundColor: darkColor,
                onPressed: () {},
                child: const Icon(
                  FlutterIcons.add_mdi,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
