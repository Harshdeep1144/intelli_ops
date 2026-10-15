import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/projects/presentation/projects_screen.dart';
import '../../features/employees/presentation/employees_screen.dart';
import '../../features/meetings/presentation/meetings_screen.dart';
import '../../features/ai_assistant/presentation/chat_screen.dart';
import '../../features/navigation/presentation/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _dashboardNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final GlobalKey<NavigatorState> _projectsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'projects');
final GlobalKey<NavigatorState> _employeesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'employees');
final GlobalKey<NavigatorState> _meetingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'meetings');
final GlobalKey<NavigatorState> _aiNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ai');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: [
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
          navigatorKey: _employeesNavigatorKey,
          routes: [
            GoRoute(
              path: '/employees',
              builder: (context, state) => const EmployeesScreen(),
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
