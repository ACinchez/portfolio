import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
                '03.',
                style: GoogleFonts.poppins(
                  fontSize: isSmallMobile ? 16 : (isMobile ? 18 : 24),
                  color: const Color(0xFF64FFDA),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Some Things I\'ve Built',
                style: GoogleFonts.poppins(
                  fontSize: isSmallMobile ? 20 : (isMobile ? 24 : 32),
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
          _buildFeaturedProject(
            'CounselorConnect: A multi-platform Application for Student Wellness and Counselor Insights ',
            'A multi-platform student wellness and guidance management system designed to bridge communication between students and guidance counselors. CoCo features real-time messaging, video consultations, mental health tracking using SUDS (Subjective Units of Distress Scale), and automated session booking. Built with Flutter for cross-platform support, Go for backend services, Supabase for authentication and data management, and integrated with LiveKit for WebRTC-based video calls. The platform is cloud-hosted on Google Cloud for scalability, security, and high availability.',
            ['Flutter', 'Go', 'LiveKit/WebRTC', 'Supabase', 'Google Cloud'],
            'https://github.com',
            'https://coco-uic.com',
            true,
            isMobile,
          ),
          // const SizedBox(height: 100),
          // _buildFeaturedProject(
          //   'Enterprise SaaS Platform',
          //   'A comprehensive enterprise solution with microservices architecture, featuring secure authentication, role-based access control, and real-time analytics. Deployed on Google Cloud with scalable infrastructure and automated CI/CD pipelines.',
          //   ['Go', 'PostgreSQL', 'Google Cloud', 'Flutter Web', 'Docker'],
          //   'https://github.com',
          //   'https://example.com',
          //   false,
          //   isMobile,
          // ),
          const SizedBox(height: 80),
          Center(
            child: Text(
              'Other Noteworthy Projects',
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 24 : 32,
                color: const Color(0xFFCCD6F6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isSmallMobile ? 1 : (isMobile ? 1 : (isTablet ? 2 : 3)),
            childAspectRatio: isSmallMobile ? 1.0 : (isMobile ? 1.1 : (isTablet ? 0.9 : 0.8)),
            crossAxisSpacing: isSmallMobile ? 12 : (isMobile ? 16 : 20),
            mainAxisSpacing: isSmallMobile ? 12 : (isMobile ? 16 : 20),
            children: [
              _buildProjectCard(
                'School Clinical Laboratory System',
                'A comprehensive laboratory management system developed during my college days. Features include patient registration, test management, result reporting, and administrative controls for clinical laboratory operations.',
                ['PHP', 'Laravel', 'MSSQL', 'Bootstrap'],
                'https://github.com',
                null,
              ),
              // _buildProjectCard(
              //   'Startup MVP Platform',
              //   'A rapid prototyping platform for startups with secure authentication, payment integration, and real-time collaboration features.',
              //   ['Flutter', 'Go', 'Supabase', 'Stripe'],
              //   'https://github.com',
              //   'https://example.com',
              // ),
              // _buildProjectCard(
              //   'Performance Optimization Tool',
              //   'A comprehensive performance monitoring and optimization tool for web applications with real-time metrics and automated alerts.',
              //   ['Go', 'PostgreSQL', 'Flutter Web', 'Monitoring'],
              //   'https://github.com',
              //   'https://example.com',
              // ),
              // _buildProjectCard(
              //   'API Gateway & Microservices',
              //   'A scalable API gateway with microservices architecture, featuring load balancing, rate limiting, and service discovery.',
              //   ['Go', 'Docker', 'Kubernetes', 'Google Cloud'],
              //   'https://github.com',
              //   null,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProject(
    String title,
    String description,
    List<String> technologies,
    String githubUrl,
    String? liveUrl,
    bool imageRight,
    bool isMobile,
  ) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Container(
          height: isMobile ? null : 400,
          child: Stack(
            children: [
              if (!isMobile)
                Positioned(
                  right: imageRight ? 0 : null,
                  left: imageRight ? null : 0,
                  top: 0,
                  child: Container(
                    width: 500,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF64FFDA).withOpacity(0.1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/coco.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image,
                              size: 100,
                              color: Color(0xFF64FFDA),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (isMobile)
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF64FFDA).withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/coco.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.image,
                            size: 60,
                            color: Color(0xFF64FFDA),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Positioned(
                right: imageRight && !isMobile ? 520 : 0,
                left: !imageRight && !isMobile ? 520 : 0,
                top: isMobile ? 200 : 25,
                child: SizedBox(
                  width: isMobile ? screenWidth - 40 : 480,
                  child: Column(
                    crossAxisAlignment: imageRight && !isMobile
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Project',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFF64FFDA),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 24 : 28,
                          color: const Color(0xFFCCD6F6),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: imageRight && !isMobile ? TextAlign.end : TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: const Color(0xFF112240),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          description,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF8892B0),
                            height: 1.5,
                          ),
                          textAlign: imageRight && !isMobile ? TextAlign.end : TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: imageRight && !isMobile
                            ? WrapAlignment.end
                            : WrapAlignment.start,
                        spacing: 15,
                        children: technologies
                            .map((tech) => Text(
                                  tech,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF8892B0),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: imageRight && !isMobile
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => _launchUrl(githubUrl),
                            icon: const FaIcon(
                              FontAwesomeIcons.github,
                              color: Color(0xFFCCD6F6),
                              size: 20,
                            ),
                          ),
                          if (liveUrl != null) const SizedBox(width: 10),
                          if (liveUrl != null)
                            IconButton(
                              onPressed: () => _launchUrl(liveUrl),
                              icon: const FaIcon(
                                FontAwesomeIcons.arrowUpRightFromSquare,
                                color: Color(0xFFCCD6F6),
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    List<String> technologies,
    String githubUrl,
    String? liveUrl,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.folder_open,
                color: Color(0xFF64FFDA),
                size: 40,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _launchUrl(githubUrl),
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: Color(0xFFCCD6F6),
                      size: 20,
                    ),
                  ),
                  if (liveUrl != null)
                    IconButton(
                      onPressed: () => _launchUrl(liveUrl),
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowUpRightFromSquare,
                        color: Color(0xFFCCD6F6),
                        size: 20,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: const Color(0xFFCCD6F6),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF8892B0),
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: technologies
                .map((tech) => Text(
                      tech,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF8892B0),
                        fontWeight: FontWeight.w500,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}