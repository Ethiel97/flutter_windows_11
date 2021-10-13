import 'package:flutter/material.dart';
import 'package:flutter_windows_11/components/main_content.dart';
import 'package:flutter_windows_11/components/videos_list.dart';
import 'package:flutter_windows_11/layout/main_layout.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MainLayout(
        child: MainContent(),
      );
}
