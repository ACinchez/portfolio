import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 60),
        vertical: isMobile ? 60 : (isTablet ? 80 : 100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '01.',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 16 : (isTablet ? 20 : 24),
                  color: const Color(0xFF64FFDA),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'About Me',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 20 : (isTablet ? 28 : 32),
                  color: const Color(0xFFCCD6F6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 1,
                  color: const Color(0xFF233554),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          if (isMobile)
            Column(
              children: [
                _buildAboutText(isMobile),
                const SizedBox(height: 30),
                _buildProfileImage(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildAboutText(isMobile),
                ),
                const SizedBox(width: 50),
                Expanded(
                  flex: 2,
                  child: _buildProfileImage(),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAboutText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! I am a full-stack developer with expertise in building and scaling multi-platform applications from concept to deployment. My technical skills span backend development with Go, Supabase, and PostgreSQL; frontend development with Flutter for mobile and web; and real-time communication systems using LiveKit/WebRTC.',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 16 : 18,
            color: const Color(0xFF8892B0),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Beyond development, I have led projects from ideation to launch, collaborating closely with cross-functional teams to deliver products that balance technical precision and user experience. My background includes startup leadership, product strategy, and navigating the business side of technology—from securing funding to managing stakeholders. I thrive in solving complex problems, optimizing performance, and bringing ideas to life through technology that makes a real-world impact.',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 16 : 18,
            color: const Color(0xFF8892B0),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Here are a few technologies I\'ve been working with recently:',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 16 : 18,
            color: const Color(0xFF8892B0),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTechItem('Go'),
                  _buildTechItem('Flutter'),
                  _buildTechItem('PostgreSQL'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTechItem('Supabase'),
                  _buildTechItem('LiveKit'),
                  _buildTechItem('Google Cloud'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTechItem(String tech) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow,
            color: Color(0xFF64FFDA),
            size: 14,
          ),
          const SizedBox(width: 10),
          Text(
            tech,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF8892B0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isMobile = screenWidth < 768;
        final isTablet = screenWidth >= 768 && screenWidth < 1024;
        final imageWidth = isMobile ? 250.0 : (isTablet ? 280.0 : 300.0);
        final imageHeight = isMobile ? 300.0 : (isTablet ? 350.0 : 380.0);
        
        return Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFF64FFDA),
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: Stack(
                children: [
                  // Main image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/adrian_picture.jpg',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: imageWidth,
                          height: imageHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xFF64FFDA).withOpacity(0.1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: isMobile ? 120 : (isTablet ? 135 : 150),
                              color: const Color(0xFF64FFDA),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Subtle overlay for the portfolio effect
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.transparent,
                            const Color(0xFF64FFDA).withOpacity(0.05),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}