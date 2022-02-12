import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/Palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clubhouse UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
        scaffoldBackgroundColor: Palette.background,
        primaryColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Palette.green),
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
