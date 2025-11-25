import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialSignInButton extends StatelessWidget {
  final String provider;
  final VoidCallback? onPressed;
  final bool isLoading;

  const SocialSignInButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGoogle = provider.toLowerCase() == 'google';
    final String text = isGoogle ? 'Sign in with Google' : 'Sign in with Apple';
    final String iconAsset = isGoogle
        ? 'assets/svg/icon_login_google.svg'
        : 'assets/svg/icon_login_apple.svg';

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                width: 22.sp,
                height: 22.sp,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
            : SvgPicture.asset(iconAsset, height: 22.sp, width: 22.sp),
        label: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: onPressed == null
                ? const Color.fromARGB(255, 86, 86, 86)
                : const Color(0xFF2800C8),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color.fromARGB(255, 191, 188, 188);
            }
            return Colors.white;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey.shade600;
            }
            return const Color(0xFF2800C8);
          }),
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
        ),
      ),
    );
  }
}
