import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _showContactForm = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '04. What\'s Next?',
            style: GoogleFonts.poppins(
              fontSize: isSmallMobile ? 14 : (isMobile ? 16 : 20),
              color: const Color(0xFF64FFDA),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Get In Touch',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 40 : 60,
              color: const Color(0xFFCCD6F6),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: isSmallMobile ? double.infinity : (isMobile ? double.infinity : (isTablet ? 500 : 600)),
            child: Text(
              'I\'m always interested in discussing new opportunities, technical challenges, and innovative projects. Whether you\'re looking for full-stack development expertise, startup technical leadership, or want to collaborate on cutting-edge solutions, I\'d love to hear from you!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: isSmallMobile ? 14 : (isMobile ? 16 : 20),
                color: const Color(0xFF8892B0),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 50),
          if (!_showContactForm)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showContactForm = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: Color(0xFF64FFDA), width: 2),
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallMobile ? 25 : (isMobile ? 30 : 40),
                  vertical: isSmallMobile ? 12 : (isMobile ? 15 : 20),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Say Hello',
                style: GoogleFonts.poppins(
                  fontSize: isSmallMobile ? 12 : (isMobile ? 14 : 16),
                  color: const Color(0xFF64FFDA),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          if (_showContactForm) _buildContactForm(isSmallMobile, isMobile, isTablet),
          const SizedBox(height: 100),
          if (!isMobile) _buildSocialLinks(),
          const SizedBox(height: 80),
          _buildFooter(isMobile),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/ACinchez'),
        const SizedBox(width: 30),
        _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/adrian-cinchez-32ba90219/'),
        const SizedBox(width: 30),
        _buildSocialIcon(FontAwesomeIcons.twitter, 'https://twitter.com'),
        const SizedBox(width: 30),
        _buildSocialIcon(FontAwesomeIcons.instagram, 'https://instagram.com'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF233554)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(
            icon,
            color: const Color(0xFF8892B0),
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(bool isMobile) {
    return Column(
      children: [
        if (isMobile)
          Column(
            children: [
              _buildSocialLinks(),
              const SizedBox(height: 30),
            ],
          ),
        Text(
          'Built with Flutter',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF8892B0),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '© 2025 Adrian Cinchez. All rights reserved.',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF8892B0),
          ),
        ),
      ],
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail(String email) async {
    final Uri uri = Uri.parse(
      'mailto:$email?subject=Portfolio Contact - Let\'s Connect!&body=Hi Adrian,%0A%0AI came across your portfolio and would love to connect with you.%0A%0A'
    );
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Fallback for web browsers - open in same tab
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  Widget _buildContactForm(bool isSmallMobile, bool isMobile, bool isTablet) {
    return Container(
      width: isSmallMobile ? double.infinity : (isMobile ? double.infinity : (isTablet ? 500 : 600)),
      padding: EdgeInsets.all(isSmallMobile ? 20 : (isMobile ? 25 : 30)),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF233554)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send me a message',
                  style: GoogleFonts.poppins(
                    fontSize: isSmallMobile ? 18 : (isMobile ? 20 : 24),
                    color: const Color(0xFFCCD6F6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showContactForm = false;
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF8892B0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Your Name',
                labelStyle: GoogleFonts.poppins(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallMobile ? 14 : 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF233554)),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF64FFDA)),
                  borderRadius: BorderRadius.circular(4),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: const Color(0xFF0A192F),
              ),
              style: GoogleFonts.poppins(
                color: const Color(0xFFCCD6F6),
                fontSize: isSmallMobile ? 14 : 16,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: GoogleFonts.poppins(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallMobile ? 14 : 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF233554)),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF64FFDA)),
                  borderRadius: BorderRadius.circular(4),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: const Color(0xFF0A192F),
              ),
              style: GoogleFonts.poppins(
                color: const Color(0xFFCCD6F6),
                fontSize: isSmallMobile ? 14 : 16,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
                labelStyle: GoogleFonts.poppins(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallMobile ? 14 : 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF233554)),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF64FFDA)),
                  borderRadius: BorderRadius.circular(4),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: const Color(0xFF0A192F),
              ),
              style: GoogleFonts.poppins(
                color: const Color(0xFFCCD6F6),
                fontSize: isSmallMobile ? 14 : 16,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Message',
                alignLabelWithHint: true,
                labelStyle: GoogleFonts.poppins(
                  color: const Color(0xFF8892B0),
                  fontSize: isSmallMobile ? 14 : 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF233554)),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF64FFDA)),
                  borderRadius: BorderRadius.circular(4),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: const Color(0xFF0A192F),
              ),
              style: GoogleFonts.poppins(
                color: const Color(0xFFCCD6F6),
                fontSize: isSmallMobile ? 14 : 16,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF64FFDA),
                      foregroundColor: const Color(0xFF0A192F),
                      padding: EdgeInsets.symmetric(
                        vertical: isSmallMobile ? 12 : (isMobile ? 15 : 18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: const Color(0xFF0A192F),
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Send Message',
                            style: GoogleFonts.poppins(
                              fontSize: isSmallMobile ? 14 : 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // EmailJS API endpoint
        const String emailJSUrl = 'https://api.emailjs.com/api/v1.0/email/send';
        
        // EmailJS configuration - you'll need to provide template_id and user_id
        final Map<String, dynamic> emailData = {
          'service_id': 'service_lcm8f6n',
          'template_id': 'template_eqd6g1l', // You need to create this in EmailJS
          'user_id': 'PeCI0U_OFhbSDRl2n', // Your EmailJS public key
          'template_params': {
            'from_name': _nameController.text,
            'from_email': _emailController.text,
            'subject': _subjectController.text,
            'message': _messageController.text,
            'to_email': 'cinchezadrian@gmail.com',
          },
        };

        final response = await http.post(
          Uri.parse(emailJSUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(emailData),
        );

        if (response.statusCode == 200) {
          // Success
          _showSuccessMessage();
          
          // Clear the form
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
          
          // Hide the form
          setState(() {
            _showContactForm = false;
          });
        } else {
          // Error
          _showErrorMessage('Failed to send message. Please try again.');
        }
      } catch (e) {
        _showErrorMessage('Failed to send message. Please check your connection.');
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSuccessMessage() {
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF112240),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF64FFDA), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64FFDA).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF64FFDA).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF64FFDA),
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Message Sent Successfully!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFCCD6F6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Thank you for reaching out! I\'ll get back to you as soon as possible.',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF8892B0),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF64FFDA),
                        foregroundColor: const Color(0xFF0A192F),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Great!',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void _showErrorMessage(String message) {
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF112240),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFF6B6B), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF6B6B).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B6B).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      color: Color(0xFFFF6B6B),
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Oops! Something went wrong',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFCCD6F6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF8892B0),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: const Color(0xFF8892B0),
                            side: const BorderSide(color: Color(0xFF233554)),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Optionally retry sending
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF6B6B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Try Again',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}