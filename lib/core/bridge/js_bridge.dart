import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feactures/feactures.dart';
import '../router/app_router.dart';

/// Singleton para manejar el bridge con JavaScript
class JsBridge {
  static ProviderContainer? _container;

  static void setup() {
    debugPrint('Configurando JS Bridge...');

    // Esta función será llamada desde main después de crear el ProviderScope
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupFlutterControls();
      _setupAuthControls();
      // _setupSponsorsControls();
      debugPrint('JS Bridge configurado completamente');
    });
  }

  static void setContainer(ProviderContainer container) {
    _container = container;
    _setupFlutterControls();
    _setupAuthControls();
    // _setupSponsorsControls();
    debugPrint('JS Bridge configurado con ProviderContainer');
  }

  static void _setupFlutterControls() {
    final navigateToJS = ((String route) {
      debugPrint('JS llamó navigateTo: $route');
      _container?.read(appRouterProvider).go(route);
      debugPrint('✅ Navegación completada a: $route');
    }).toJS;

    final controlsObject =
        <String, JSAny>{'navigateTo': navigateToJS}.jsify() as JSObject;

    globalContext.setProperty('flutterControls'.toJS, controlsObject);
    debugPrint('✅ flutterControls configurado');
  }

  static void _setupAuthControls() {
    final updateAuthTemplateJS = ((String template) {
      debugPrint('🔄 [AUTH] JS llamó updateAuthTemplate: $template');
      _container?.read(authProvider.notifier).setTemplate(template);
      debugPrint('✅ [AUTH] Template actualizado a: $template');
    }).toJS;

    final updateTemplate3SettingsJS =
        ((
              bool showGoogle,
              bool showApple,
              bool showTerms,
              String? backgroundImage,
            ) {
              debugPrint('🔄 [AUTH] JS llamó updateTemplate3Settings');
              _container
                  ?.read(authProvider.notifier)
                  .setTemplate3Settings(
                    showGoogle: showGoogle,
                    showApple: showApple,
                    showTerms: showTerms,
                    backgroundImage: backgroundImage,
                  );
              debugPrint('✅ [AUTH] Template 3 settings actualizados');
            })
            .toJS;

    final authControls =
        <String, JSAny>{
              'updateAuthTemplate': updateAuthTemplateJS,
              'updateTemplate3Settings': updateTemplate3SettingsJS,
            }.jsify()
            as JSObject;

    globalContext.setProperty('authControls'.toJS, authControls);
    debugPrint('✅ authControls configurado');
  }

  // static void _setupSponsorsControls() {
  //   final updateSettingsJS =
  //       ((
  //             String viewMode,
  //             bool showImage,
  //             bool showTitle,
  //             bool showLinkedin,
  //             bool showDescription,
  //           ) {
  //             debugPrint('🔄 [SPONSORS] JS llamó updateSettings: $viewMode');
  //             _container
  //                 ?.read(sponsorsNotifierProvider.notifier)
  //                 .updateSettings(
  //                   viewMode: viewMode,
  //                   showImage: showImage,
  //                   showTitle: showTitle,
  //                   showLinkedin: showLinkedin,
  //                   showDescription: showDescription,
  //                 );
  //             debugPrint('✅ [SPONSORS] Settings actualizados');
  //           })
  //           .toJS;

  //   final sponsorsControls =
  //       <String, JSAny>{'updateSettings': updateSettingsJS}.jsify() as JSObject;

  //   globalContext.setProperty('sponsorsControls'.toJS, sponsorsControls);
  //   debugPrint('✅ sponsorsControls configurado');
  // }
}
