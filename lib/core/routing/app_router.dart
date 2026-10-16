import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/projects/presentation/projects_screen.dart';
import '../../features/meetings/presentation/meetings_screen.dart';
import '../../features/ai_assistant/presentation/chat_screen.dart';
import '../../features/navigation/presentation/main_scaffold.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/data/auth_repository.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _dashboardNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final GlobalKey<NavigatorState> _projectsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'projects');
final GlobalKey<NavigatorState> _meetingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'meetings');
final GlobalKey<NavigatorState> _aiNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ai');

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    redirect: (context, state) {
      final isAuthenticated = authState.value != null;
      final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/signup';

      if (authState.isLoading) {
        return null; // Do not redirect while loading auth state
      }

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _dashboardNavigatorKey,
            routes: [
              GoRoute(
                path: '/dashboard',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _projectsNavigatorKey,
            routes: [
              GoRoute(
                path: '/projects',
                builder: (context, state) => const ProjectsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _meetingsNavigatorKey,
            routes: [
              GoRoute(
                path: '/meetings',
                builder: (context, state) => const MeetingsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _aiNavigatorKey,
            routes: [
              GoRoute(
                path: '/ai',
                builder: (context, state) => const ChatScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
