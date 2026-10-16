import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/data/auth_repository.dart';

class MainScaffold extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntelliOps'),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut),
            onPressed: () async {
              await ref.read(authRepositoryProvider).signOut();
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(LucideIcons.layoutDashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.folderKanban),
            label: 'Projects',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.users),
            label: 'Employees',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.calendar),
            label: 'Meetings',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.sparkles),
            label: 'AI Assistant',
          ),
        ],
      ),
    );
  }
}
