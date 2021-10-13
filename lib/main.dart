import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';
import 'package:flutter_windows_11/pages/dashboard.dart';
import 'package:flutter_windows_11/providers/menu_item_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<MenuItemProvider>(
        create: (_) => MenuItemProvider(),
        builder: (context, _) => const MyApp(),
      )
    ]),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Windows',
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
          fontFamily: GoogleFonts.dmSans().fontFamily,
          primarySwatch: Colors.blue,
          backgroundColor: backgroundColor,
        ),
        home: const SafeArea(
          child: Dashboard(),
        ),
        debugShowCheckedModeBanner: false,
      );
}
