import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const CustomAppBar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isSmallMobile = screenWidth < 480;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: isSmallMobile ? 60 : (isMobile ? 70 : 80),
        padding: EdgeInsets.symmetric(
          horizontal: isSmallMobile ? 16 : 20,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0A192F).withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Adrian Cinchez',
              style: GoogleFonts.poppins(
                fontSize: isSmallMobile ? 18 : (isMobile ? 20 : 24),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF64FFDA),
              ),
            ),
            if (!isMobile)
              Row(
                children: [
                  _buildNavButton('Home', onHomePressed),
                  const SizedBox(width: 20),
                  _buildNavButton('About', onAboutPressed),
                  const SizedBox(width: 20),
                  _buildNavButton('Skills', onSkillsPressed),
                  const SizedBox(width: 20),
                  _buildNavButton('Projects', onProjectsPressed),
                  const SizedBox(width: 20),
                  _buildNavButton('Contact', onContactPressed),
                ],
              ),
            if (isMobile)
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.menu, 
                  color: const Color(0xFF64FFDA),
                  size: isSmallMobile ? 20 : 24,
                ),
                onSelected: (value) {
                  switch (value) {
                    case 'Home':
                      onHomePressed();
                      break;
                    case 'About':
                      onAboutPressed();
                      break;
                    case 'Skills':
                      onSkillsPressed();
                      break;
                    case 'Projects':
                      onProjectsPressed();
                      break;
                    case 'Contact':
                      onContactPressed();
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  'Home',
                  'About',
                  'Skills',
                  'Projects',
                  'Contact'
                ].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: GoogleFonts.poppins(
                        fontSize: isSmallMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}