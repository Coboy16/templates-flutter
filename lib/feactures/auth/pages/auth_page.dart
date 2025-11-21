import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../templates/templates.dart';
import '../models/models.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    print('[AUTH] Renderizando template: ${authState.currentTemplate}');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildTemplate(authState.currentTemplate, authState),
    );
  }

  Widget _buildTemplate(String template, AuthState authState) {
    switch (template) {
      case 'template1':
        return const LoginTemplate1();

      case 'template2':
        return const LoginTemplate2();

      case 'template3':
        return LoginTemplate3();

      default:
        return _buildErrorTemplate(template);
    }
  }

  Widget _buildErrorTemplate(String template) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Template no encontrado: $template',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
