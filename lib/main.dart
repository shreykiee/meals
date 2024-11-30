import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.mandyRed,
            textTheme: GoogleFonts.latoTextTheme()),
        theme: FlexThemeData.light(
            scheme: FlexScheme.mandyRed,
            textTheme: GoogleFonts.latoTextTheme()),
        home: CategoriesScreen());
  }
}
