import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class LoginTemplate3 extends ConsumerStatefulWidget {
  const LoginTemplate3({super.key});

  @override
  ConsumerState<LoginTemplate3> createState() => _LoginTemplate3State();
}

class _LoginTemplate3State extends ConsumerState<LoginTemplate3> {
  bool _termsAccepted = true;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final screenSize = MediaQuery.of(context).size;

    _logRenderInfo(authState);

    return Scaffold(
      body: Stack(
        children: [
          _TemplateBackground(
            screenSize: screenSize,
            backgroundImage: authState.backgroundImage,
          ),
          _TemplateContent(
            screenSize: screenSize,
            authState: authState,
            termsAccepted: _termsAccepted,
            onTermsChanged: (value) => setState(() => _termsAccepted = value),
            onGoogleSignIn: _handleGoogleSignIn,
            onAppleSignIn: _handleAppleSignIn,
            logoImage: authState.logoImage,
          ),
        ],
      ),
    );
  }

  void _logRenderInfo(authState) {
    debugPrint(
      '[TEMPLATE3] Renderizando - Google: ${authState.showGoogle}, '
      'Apple: ${authState.showApple}, Terms: ${authState.showTerms}',
    );
  }

  void _handleGoogleSignIn() {
    debugPrint('[TEMPLATE3] Google Sign-In clicked');
  }

  void _handleAppleSignIn() {
    debugPrint('[TEMPLATE3] Apple Sign-In clicked');
  }
}

class _TemplateBackground extends StatelessWidget {
  final Size screenSize;
  final String? backgroundImage;

  const _TemplateBackground({required this.screenSize, this.backgroundImage});

  static const String _defaultBackgroundSvg = 'assets/svg/fonsss.svg';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBaseGradient(), _buildBackgroundImage()]);
  }

  Widget _buildBaseGradient() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: backgroundImage == null
              ? const [Color(0xFF2800C8), Color(0xFF1a0080), Color(0xFF0d0040)]
              : [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.4)],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    if (backgroundImage != null && backgroundImage!.isNotEmpty) {
      return _buildNetworkImage();
    }
    return _buildDefaultSvgBackground();
  }

  Widget _buildNetworkImage() {
    return Positioned.fill(
      child: Stack(
        children: [
          Image.network(
            backgroundImage!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              debugPrint('[TEMPLATE3] Error cargando imagen: $error');
              return _buildDefaultSvgBackground();
            },
          ),
          _buildDarkOverlay(),
        ],
      ),
    );
  }

  Widget _buildDefaultSvgBackground() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: SvgPicture.asset(
        _defaultBackgroundSvg,
        height: screenSize.height,
        width: screenSize.width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDarkOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }
}

class _TemplateContent extends StatelessWidget {
  final Size screenSize;
  final dynamic authState;
  final bool termsAccepted;
  final ValueChanged<bool> onTermsChanged;
  final VoidCallback onGoogleSignIn;
  final VoidCallback onAppleSignIn;
  final String? logoImage;

  const _TemplateContent({
    required this.screenSize,
    required this.authState,
    required this.termsAccepted,
    required this.onTermsChanged,
    required this.onGoogleSignIn,
    required this.onAppleSignIn,
    this.logoImage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            _buildCentralLogo(),
            SizedBox(height: screenSize.height * 0.03),
            _buildSignInButtons(context),
            const SizedBox(height: 24),
            if (authState.showTerms) _buildTermsCheckbox(context),
            const Spacer(flex: 2),
            _buildVersionText(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCentralLogo() {
    const defaultLogoSvg = 'assets/svg/logo_center.svg';

    return SizedBox(
      width: screenSize.width * 0.79,
      height: 100,
      child: (logoImage != null && logoImage!.isNotEmpty)
          ? Image.network(
              logoImage!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('[TEMPLATE3] Error cargando logo: $error');
                return SvgPicture.asset(defaultLogoSvg, fit: BoxFit.contain);
              },
            )
          : SvgPicture.asset(defaultLogoSvg, fit: BoxFit.contain),
    );
  }

  Widget _buildSignInButtons(BuildContext context) {
    final showGoogle = authState.showGoogle;
    final showApple = authState.showApple;
    final showTerms = authState.showTerms;

    if (!showGoogle && !showApple) {
      return _buildNoButtonsMessage();
    }

    return Column(
      children: [
        if (showGoogle) ...[
          _buildGoogleButton(showTerms),
          const SizedBox(height: 16),
        ],
        if (showApple) ...[
          _buildAppleButton(showTerms),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _buildNoButtonsMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'Activa al menos un método de login',
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _buildGoogleButton(bool showTerms) {
    final isEnabled = !showTerms || termsAccepted;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SocialSignInButton(
        provider: 'google',
        isLoading: false,
        onPressed: isEnabled ? onGoogleSignIn : null,
      ),
    );
  }

  Widget _buildAppleButton(bool showTerms) {
    final isEnabled = !showTerms || termsAccepted;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SocialSignInButton(
        provider: 'apple',
        isLoading: false,
        onPressed: isEnabled ? onAppleSignIn : null,
      ),
    );
  }

  Widget _buildTermsCheckbox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24.w,
            height: 24.w,
            child: Checkbox(
              value: termsAccepted,
              onChanged: (value) => onTermsChanged(value ?? false),
              activeColor: Colors.white,
              checkColor: const Color(0xFF2800C8),
              side: BorderSide(color: Colors.white, width: 2.r),
            ),
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: GestureDetector(
              onTap: () => _showTermsBottomSheet(context),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  children: [
                    const TextSpan(text: 'I accept the '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTermsBottomSheet(BuildContext context) {
    showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TermsBottomSheet(),
    ).then((accepted) {
      if (accepted == true) {
        onTermsChanged(true);
      }
    });
  }

  Widget _buildVersionText() {
    return Text(
      'v1.0.0',
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }
}
