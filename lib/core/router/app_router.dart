import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feactures/feactures.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/sponsors',
        name: 'sponsors',
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const SponsorsPage()),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const AuthPage()),
      ),
      GoRoute(
        path: '/speakers',
        name: 'speakers',
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const SpeakersPage()),
      ),
      GoRoute(
        path: '/agenda',
        name: 'agenda',
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const AgendaPage()),
      ),
    ],
  );
}
