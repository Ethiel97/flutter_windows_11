import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/layout/top_bar.dart';

import 'side_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Row(
          children: [
            const SideBar(),
            Expanded(
              child: Column(
                children: [
                  const TopBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(componentPadding),
                        child: child,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
