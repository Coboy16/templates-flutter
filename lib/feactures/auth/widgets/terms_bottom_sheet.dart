import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsBottomSheet extends StatelessWidget {
  const TermsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.85.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          _buildHandle(),
          _buildHeader(context),
          Expanded(child: _buildContent()),
          _buildAcceptButton(context),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 16.w, 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Terms and Conditions',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, size: 24.sp),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLastUpdated(),
          SizedBox(height: 24.h),
          _buildSection(
            '1. Acceptance of Terms',
            'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
          ),
          _buildSection(
            '2. Use License',
            'Permission is granted to temporarily download one copy of the materials (information or software) on our application for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\n'
                '• Modify or copy the materials\n'
                '• Use the materials for any commercial purpose\n'
                '• Attempt to decompile or reverse engineer any software\n'
                '• Remove any copyright or other proprietary notations',
          ),
          _buildSection(
            '3. Privacy Policy',
            'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your personal information. By using our service, you agree to the collection and use of information in accordance with our Privacy Policy.\n\n'
                'We collect information that you provide directly to us, including:\n'
                '• Name and contact information\n'
                '• Account credentials\n'
                '• Profile information\n'
                '• Communications with us',
          ),
          _buildSection(
            '4. User Account',
            'When you create an account with us, you must provide information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms.\n\n'
                'You are responsible for safeguarding the password that you use to access the service and for any activities or actions under your password.',
          ),
          _buildSection(
            '5. Intellectual Property',
            'The service and its original content, features, and functionality are and will remain the exclusive property of our company and its licensors. The service is protected by copyright, trademark, and other laws.',
          ),
          _buildSection(
            '6. User Content',
            'Our service may allow you to post, link, store, share and otherwise make available certain information, text, graphics, or other material. You are responsible for the content that you post on or through the service.',
          ),
          _buildSection(
            '7. Prohibited Uses',
            'You may not use our service:\n\n'
                '• In any way that violates any applicable law or regulation\n'
                '• To transmit any harmful or malicious code\n'
                '• To impersonate or attempt to impersonate the company or another user\n'
                '• To engage in any automated data collection activities\n'
                '• To interfere with or circumvent security features',
          ),
          _buildSection(
            '8. Limitation of Liability',
            'In no event shall our company, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.',
          ),
          _buildSection(
            '9. Termination',
            'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the service will immediately cease.',
          ),
          _buildSection(
            '10. Changes to Terms',
            'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days notice prior to any new terms taking effect.',
          ),
          _buildSection(
            '11. Contact Us',
            'If you have any questions about these Terms, please contact us at:\n\n'
                'Email: support@example.com\n'
                'Phone: +1 (555) 123-4567\n'
                'Address: 123 Business Street, City, State 12345',
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildLastUpdated() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        'Last updated: January 2025',
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: Colors.blue[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2800C8),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            'Accept Terms',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
