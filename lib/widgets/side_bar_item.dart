import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/models/menu_item.dart';
import 'package:flutter_windows_11/providers/menu_item_provider.dart';
import 'package:flutter_windows_11/widgets/user_with_status.dart';
import 'package:provider/provider.dart';

class SideBarMenuItem extends StatefulWidget {
  final MenuItem menuItem;
  final bool isDesktop;

  const SideBarMenuItem(this.menuItem, [this.isDesktop = false]);

  @override
  State<SideBarMenuItem> createState() => _SideBarMenuItemState();
}

class _SideBarMenuItemState extends State<SideBarMenuItem> {
  var _bgColor = Colors.transparent;
  final _iconColor = textColor;
  double horizontalPadding = 0;

  late MenuItemProvider _menuItemProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      // _menuItemProvider = Provider.of<MenuItemProvider>(context, listen: false);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menuItemProvider = Provider.of<MenuItemProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _menuItemProvider.setItem(widget.menuItem);
      },
      child: MouseRegion(
        onHover: (e) {
          setState(() {
            _bgColor = Colors.black.withOpacity(.1);
            horizontalPadding = 8;
          });
        },
        onExit: (e) {
          setState(() {
            _bgColor = Colors.transparent;
            horizontalPadding = 0;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: widget.isDesktop ? null : 40,
          height: 36,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: _bgColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: widget.isDesktop
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              if (widget.menuItem.image == null) ...[
                Icon(
                  widget.menuItem.icon,
                  size: 17,
                  color: _iconColor,
                ),
              ] else
                UserWithStatus(
                  image: widget.menuItem.image!,
                  size: 30,
                ),
              if (widget.isDesktop) ...[
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    widget.menuItem.label,
                    style: TextStyle(
                      color: _iconColor,
                      fontWeight: widget.menuItem.image != null
                          ? FontWeight.w400
                          : FontWeight.normal,
                    ),
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
      ),
    );
  }
}
