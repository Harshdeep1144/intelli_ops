import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
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
    return GlassScaffold(
      settings: LiquidGlassSettings.ios27Light,
      edgeToEdge: true,
      statusBarStyle: GlassStatusBarStyle.dark,
      backgroundColor: Colors.white,
      appBar: GlassAppBar(
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut, color: Color(0xFF0F172A)),
            onPressed: () async {
              await ref.read(authRepositoryProvider).signOut();
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: navigationShell,
      bottomBar: GlassTabBar.bottom(
        settings: LiquidGlassSettings.ios27Light,
        selectedIndex: navigationShell.currentIndex,
        onTabSelected: _goBranch,
        tabs: const [
          GlassTab(
            icon: Icon(LucideIcons.layoutDashboard),
          ),
          GlassTab(
            icon: Icon(LucideIcons.folderKanban),
          ),
          GlassTab(
            icon: Icon(LucideIcons.users),
          ),
          GlassTab(
            icon: Icon(LucideIcons.calendar),
          ),
          GlassTab(
            icon: Icon(LucideIcons.sparkles),
          ),
        ],
      ),
    );
  }
}
