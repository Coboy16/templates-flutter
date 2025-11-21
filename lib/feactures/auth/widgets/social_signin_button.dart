import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialSignInButton extends StatelessWidget {
  final String provider; // 'google' o 'apple'
  final VoidCallback? onPressed;
  final bool isLoading;

  const SocialSignInButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.isLoading = false,
  });

  static const double _smallScreenHeight = 600;
  static const double _mediumScreenHeight = 800;

  @override
  Widget build(BuildContext context) {
    final bool isGoogle = provider.toLowerCase() == 'google';
    final String text = isGoogle ? 'Sign in with Google' : 'Sign in with Apple';
    final String iconAsset = isGoogle
        ? 'assets/svg/icon_login_google.svg'
        : 'assets/svg/icon_login_apple.svg';

    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;

    final double buttonHeight = _getButtonHeight(screenHeight);
    final double fontSize = _getFontSize(screenHeight);
    final double iconSize = _getIconSize(screenHeight);

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                width: iconSize,
                height: iconSize,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
            : SvgPicture.asset(iconAsset, height: iconSize, width: iconSize),
        label: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: const Color(0xFF2800C8),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF2800C8),
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  double _getButtonHeight(double screenHeight) {
    if (screenHeight < _smallScreenHeight) return 48;
    if (screenHeight < _mediumScreenHeight) return 56;
    return 60;
  }

  double _getFontSize(double screenHeight) {
    if (screenHeight < _smallScreenHeight) return 14;
    if (screenHeight < _mediumScreenHeight) return 16;
    return 17;
  }

  double _getIconSize(double screenHeight) {
    if (screenHeight < _smallScreenHeight) return 20;
    if (screenHeight < _mediumScreenHeight) return 22;
    return 24;
  }
}
