import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    debugPrint('[AUTH] Inicializando AuthNotifier');
    return const AuthState(currentTemplate: 'template1');
  }

  void setTemplate(String template) {
    debugPrint('[AUTH] Cambiando template a: $template');
    state = state.copyWith(currentTemplate: template);
  }

  void setTemplate3Settings({
    required bool showGoogle,
    required bool showApple,
    required bool showTerms,
    String? backgroundImage,
    String? logoImage,
  }) {
    debugPrint('[AUTH] Actualizando Template 3 settings');
    state = state.copyWith(
      showGoogle: showGoogle,
      showApple: showApple,
      showTerms: showTerms,
      backgroundImage: backgroundImage,
      logoImage: logoImage,
    );
  }
}
