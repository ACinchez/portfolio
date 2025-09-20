import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isSmallMobile = screenWidth < 480;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallMobile ? 16 : (isMobile ? 20 : (isTablet ? 40 : 60)),
        vertical: isSmallMobile ? 40 : (isMobile ? 60 : (isTablet ? 80 : 100)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '02.',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 18 : 24,
                  color: const Color(0xFF64FFDA),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Skills & Technologies',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 24 : 32,
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
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
            childAspectRatio: isSmallMobile ? 1.6 : (isMobile ? 2.0 : (isTablet ? 1.5 : 1.2)),
            crossAxisSpacing: isSmallMobile ? 12 : (isMobile ? 20 : 30),
            mainAxisSpacing: isSmallMobile ? 12 : (isMobile ? 20 : 30),
            children: [
              _buildSkillCategory(
                'Frontend',
                ['Flutter', 'Dart', 'Flutter Web', 'Responsive Design', 'Real-time UI', 'Material Design'],
                Icons.web,
              ),
              _buildSkillCategory(
                'Backend',
                ['Go', 'Supabase', 'PostgreSQL', 'LiveKit/WebRTC', 'REST APIs', 'GraphQL'],
                Icons.storage,
              ),
              _buildSkillCategory(
                'Cloud & DevOps',
                ['Google Cloud', 'Docker', 'CI/CD','Monitoring'],
                Icons.build,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<String> skills, IconData icon) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isSmallMobile = screenWidth < 480;
        final isMobile = screenWidth < 768;
        
        return Container(
          padding: EdgeInsets.all(isSmallMobile ? 16 : (isMobile ? 20 : 30)),
          decoration: BoxDecoration(
            color: const Color(0xFF112240),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFF233554),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: const Color(0xFF64FFDA),
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: isSmallMobile ? 16 : (isMobile ? 18 : 20),
                        color: const Color(0xFFCCD6F6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isSmallMobile ? 12 : 20),
              Wrap(
                spacing: isSmallMobile ? 4 : 8,
                runSpacing: isSmallMobile ? 4 : 8,
                children: skills.map((skill) => _buildSkillChip(skill)).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkillChip(String skill) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isSmallMobile = screenWidth < 480;
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallMobile ? 8 : 12,
            vertical: isSmallMobile ? 4 : 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF64FFDA).withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color(0xFF64FFDA).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            skill,
            style: GoogleFonts.poppins(
              fontSize: isSmallMobile ? 10 : 12,
              color: const Color(0xFF64FFDA),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}