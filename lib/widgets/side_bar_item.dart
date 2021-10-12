import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/models/menu_item.dart';

class SideBarMenuItem extends StatefulWidget {
  final MenuItem menuItem;
  final bool isDesktop;

  const SideBarMenuItem(this.menuItem, [this.isDesktop = false]);

  @override
  State<SideBarMenuItem> createState() => _SideBarMenuItemState();
}

class _SideBarMenuItemState extends State<SideBarMenuItem> {
  var _bgColor = Colors.transparent;
  var _iconColor = darkColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          _bgColor = Colors.black12;
        });
      },
      onExit: (e) {
        setState(() {
          _bgColor = Colors.white;
          _iconColor = Colors.white;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        width: widget.isDesktop ? null : 44,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: _bgColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: widget.isDesktop
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Icon(
              widget.menuItem.icon,
              size: 20,
              color: _iconColor,
            ),
            if (widget.isDesktop) ...[
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.menuItem.name,
                style: TextStyle(
                  color: _iconColor,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                child: widget.menuItem.trailing,
              ),
            ] else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
