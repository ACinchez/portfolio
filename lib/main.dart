import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/portfolio_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full-Stack Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF64FFDA),
          secondary: Color(0xFF64FFDA),
          background: Color(0xFF0A192F),
          surface: Color(0xFF112240),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A192F),
      ),
      home: const PortfolioScreen(),
    );
  }
}
