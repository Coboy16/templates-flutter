import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTemplate3 extends StatefulWidget {
  const LoginTemplate3({super.key});

  @override
  State<LoginTemplate3> createState() => LoginTemplate3State();
}

class LoginTemplate3State extends State<LoginTemplate3> {
  bool _termsAccepted = false;
  bool _isLoading = false;

  // Opciones controlables desde React
  bool _showGoogle = true;
  bool _showApple = true;
  bool _showTerms = true;
  String? _backgroundImage;

  void _handleGoogleSignIn() {
    print('🔐 [TEMPLATE3] Google Sign-In clicked');
    // Aquí conectarías con tu BLoC de Google Auth
  }

  void _handleAppleSignIn() {
    print('🔐 [TEMPLATE3] Apple Sign-In clicked');
    // Aquí conectarías con tu BLoC de Apple Auth
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Terms and Conditions',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Aquí irían los términos y condiciones de tu aplicación.',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // Método para actualizar las opciones desde React
  void updateTemplate3Options({
    bool? showGoogle,
    bool? showApple,
    bool? showTerms,
    String? backgroundImage,
  }) {
    setState(() {
      if (showGoogle != null) _showGoogle = showGoogle;
      if (showApple != null) _showApple = showApple;
      if (showTerms != null) _showTerms = showTerms;
      if (backgroundImage != null) _backgroundImage = backgroundImage;
    });
    print(
      '🔐 [TEMPLATE3] Opciones actualizadas: G=$_showGoogle, A=$_showApple, T=$_showTerms, IMG=${_backgroundImage != null}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          _buildBackground(screenSize),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  // Logo placeholder (superior)
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.flutter_dash,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Logo central (más grande)
                  Container(
                    width: screenWidth * 0.5,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.flutter_dash,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.08),

                  // Google Sign-In Button (condicional)
                  if (_showGoogle) ...[
                    _buildGoogleButton(),
                    const SizedBox(height: 16),
                  ],

                  // Apple Sign-In Button (condicional)
                  if (_showApple) ...[
                    _buildAppleButton(),
                    const SizedBox(height: 20),
                  ],

                  // Mensaje si no hay botones visibles
                  if (!_showGoogle && !_showApple)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Activa al menos un método de login',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),

                  // Loading indicator
                  if (_isLoading)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Connecting...',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24),

                  // Terms and conditions checkbox (condicional)
                  if (_showTerms) _buildTermsCheckbox(),

                  const Spacer(flex: 2),

                  // Version text
                  Text(
                    'v1.0.0',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(Size screenSize) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _backgroundImage == null
              ? const [Color(0xFF2800C8), Color(0xFF1a0080), Color(0xFF0d0040)]
              : [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.4)],
        ),
      ),
      child: _backgroundImage != null
          ? Stack(
              children: [
                // Imagen de fondo
                Positioned.fill(
                  child: Image.network(
                    _backgroundImage!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('❌ Error cargando imagen: $error');
                      return Container(color: const Color(0xFF2800C8));
                    },
                  ),
                ),
                // Overlay oscuro
                Positioned.fill(
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
                ),
              ],
            )
          : CustomPaint(painter: BackgroundPatternPainter()),
    );
  }

  Widget _buildGoogleButton() {
    final isEnabled = !_showTerms || _termsAccepted;

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: isEnabled ? _handleGoogleSignIn : null,
        icon: const Icon(
          Icons.g_mobiledata,
          size: 28,
          color: Color(0xFF2800C8),
        ),
        label: Text(
          'Sign in with Google',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: const Color(0xFF2800C8),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white.withOpacity(0.5);
            }
            return Colors.white;
          }),
          foregroundColor: MaterialStateProperty.all(const Color(0xFF2800C8)),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  Widget _buildAppleButton() {
    final isEnabled = !_showTerms || _termsAccepted;

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: isEnabled ? _handleAppleSignIn : null,
        icon: const Icon(Icons.apple, size: 24, color: Color(0xFF2800C8)),
        label: Text(
          'Sign in with Apple',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: const Color(0xFF2800C8),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white.withOpacity(0.5);
            }
            return Colors.white;
          }),
          foregroundColor: MaterialStateProperty.all(const Color(0xFF2800C8)),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: _termsAccepted,
              onChanged: (value) {
                setState(() {
                  _termsAccepted = value ?? false;
                });
              },
              activeColor: Colors.white,
              checkColor: const Color(0xFF2800C8),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: GestureDetector(
              onTap: _showTermsDialog,
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  children: [
                    const TextSpan(text: 'I accept the '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
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
}

/// Custom painter para el patrón de fondo decorativo
class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Dibujar círculos decorativos
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.3), 100, paint);

    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.7), 80, paint);

    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.15), 60, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
