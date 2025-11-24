import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feactures/auth/providers/providers.dart';
import '../router/app_router.dart';

/// Singleton para manejar el bridge con JavaScript
class JsBridge {
  static ProviderContainer? _container;
  static bool _isSetup = false;

  /// Inicializa el container de Riverpod
  static void initContainer(ProviderContainer container) {
    debugPrint('[BRIDGE] Inicializando container');
    _container = container;
    _setupAllBridges();
  }

  /// Configura todos los bridges
  static void _setupAllBridges() {
    if (_isSetup) {
      debugPrint('[BRIDGE] Ya está configurado, saltando...');
      return;
    }

    debugPrint('[BRIDGE] Configurando bridges...');
    _setupFlutterControls();
    _setupAuthControls();
    _setupSponsorsControls();
    _isSetup = true;
    debugPrint('[BRIDGE] Todos los bridges configurados');
  }

  static void _setupFlutterControls() {
    final navigateToJS = ((String route) {
      debugPrint('[BRIDGE] JS llamó navigateTo: $route');

      if (_container == null) {
        debugPrint('[BRIDGE] Container no disponible');
        return;
      }

      try {
        final router = _container!.read(appRouterProvider);
        router.go(route);
        debugPrint('[BRIDGE] Navegación completada a: $route');
      } catch (e) {
        debugPrint('[BRIDGE] Error navegando: $e');
      }
    }).toJS;

    final controlsObject =
        <String, JSAny>{'navigateTo': navigateToJS}.jsify() as JSObject;

    globalContext.setProperty('flutterControls'.toJS, controlsObject);
    debugPrint('[BRIDGE] flutterControls configurado');
  }

  static void _setupAuthControls() {
    final updateAuthTemplateJS = ((String template) {
      debugPrint('[AUTH-BRIDGE] JS llamó updateAuthTemplate: $template');

      if (_container == null) {
        debugPrint('[AUTH-BRIDGE] Container no disponible');
        return;
      }

      try {
        _container!.read(authProvider.notifier).setTemplate(template);
        debugPrint('[AUTH-BRIDGE] Template actualizado a: $template');
      } catch (e) {
        debugPrint('[AUTH-BRIDGE] Error: $e');
      }
    }).toJS;

    final updateTemplate3SettingsJS =
        ((
              bool showGoogle,
              bool showApple,
              bool showTerms,
              String? backgroundImage,
            ) {
              debugPrint('[AUTH-BRIDGE] JS llamó updateTemplate3Settings');

              if (_container == null) {
                debugPrint('[AUTH-BRIDGE] Container no disponible');
                return;
              }

              try {
                _container!
                    .read(authProvider.notifier)
                    .setTemplate3Settings(
                      showGoogle: showGoogle,
                      showApple: showApple,
                      showTerms: showTerms,
                      backgroundImage: backgroundImage,
                    );
                debugPrint(
                  '   Google: $showGoogle, Apple: $showApple, Terms: $showTerms',
                );
                debugPrint('[AUTH-BRIDGE] Template 3 settings actualizados');
              } catch (e) {
                debugPrint('[AUTH-BRIDGE] Error: $e');
              }
            })
            .toJS;

    final authControls =
        <String, JSAny>{
              'updateAuthTemplate': updateAuthTemplateJS,
              'updateTemplate3Settings': updateTemplate3SettingsJS,
            }.jsify()
            as JSObject;

    globalContext.setProperty('authControls'.toJS, authControls);
    debugPrint('[BRIDGE] authControls configurado');
  }

  static void _setupSponsorsControls() {
    final updateSettingsJS =
        ((
              String viewMode,
              bool showImage,
              bool showTitle,
              bool showLinkedin,
              bool showDescription,
            ) {
              debugPrint(
                '[SPONSORS-BRIDGE] JS llamó updateSettings: $viewMode',
              );

              if (_container == null) {
                debugPrint('[SPONSORS-BRIDGE] Container no disponible');
                return;
              }

              try {
                debugPrint('[SPONSORS-BRIDGE] Settings actualizados');
              } catch (e) {
                debugPrint('[SPONSORS-BRIDGE] Error: $e');
              }
            })
            .toJS;

    final sponsorsControls =
        <String, JSAny>{'updateSettings': updateSettingsJS}.jsify() as JSObject;

    globalContext.setProperty('sponsorsControls'.toJS, sponsorsControls);
    debugPrint('[BRIDGE] sponsorsControls configurado');
  }
}
