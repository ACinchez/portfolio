import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onCheckWorkPressed;
  
  const HeroSection({super.key, this.onCheckWorkPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? screenHeight * 0.8 : screenHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 60),
        vertical: isMobile ? 60 : (isTablet ? 80 : 100),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A192F),
            Color(0xFF112240),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, my name is',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : (isTablet ? 18 : 20),
              color: const Color(0xFF64FFDA),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Adrian Cinchez.',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : (isTablet ? 60 : 80),
              fontWeight: FontWeight.bold,
              color: const Color(0xFFCCD6F6),
              height: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: isMobile ? 80 : (isTablet ? 120 : 140),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'I build scalable applications.',
                  textStyle: GoogleFonts.poppins(
                    fontSize: isMobile ? 28 : (isTablet ? 50 : 70),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8892B0),
                    height: 1.1,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TyperAnimatedText(
                  'I architect cloud solutions.',
                  textStyle: GoogleFonts.poppins(
                    fontSize: isMobile ? 28 : (isTablet ? 50 : 70),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8892B0),
                    height: 1.1,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TyperAnimatedText(
                  'I lead technical projects.',
                  textStyle: GoogleFonts.poppins(
                    fontSize: isMobile ? 28 : (isTablet ? 50 : 70),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8892B0),
                    height: 1.1,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: isMobile ? double.infinity : (isTablet ? 500 : 600),
            child: Text(
              'I\'m a full-stack developer with expertise in building and scaling multi-platform applications from concept to deployment. I specialize in Go, Flutter, and real-time communication systems, with experience leading technical projects and startup initiatives.',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : (isTablet ? 18 : 20),
                color: const Color(0xFF8892B0),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: onCheckWorkPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Color(0xFF64FFDA), width: 2),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 25 : (isTablet ? 35 : 40),
                vertical: isMobile ? 12 : (isTablet ? 16 : 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Check out my work!',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 12 : (isTablet ? 14 : 16),
                color: const Color(0xFF64FFDA),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}