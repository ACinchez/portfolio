import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/custom_app_bar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  HeroSection(
                  key: _homeKey,
                  onCheckWorkPressed: () => _scrollToSection(_projectsKey),
                ),
                  AboutSection(key: _aboutKey),
                  SkillsSection(key: _skillsKey),
                  ProjectsSection(key: _projectsKey),
                  ContactSection(key: _contactKey),
                ],
              ),
            ),
          CustomAppBar(
            onHomePressed: () => _scrollToSection(_homeKey),
            onAboutPressed: () => _scrollToSection(_aboutKey),
            onSkillsPressed: () => _scrollToSection(_skillsKey),
            onProjectsPressed: () => _scrollToSection(_projectsKey),
            onContactPressed: () => _scrollToSection(_contactKey),
          ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}