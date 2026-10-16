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
      backgroundColor: const Color(0xFFE6ECE9), // Pale mint/sage background matching the reference image
      appBar: GlassAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GlassIconButton(
              icon: const Icon(LucideIcons.logOut, color: Color(0xFF0F172A), size: 20),
              onPressed: () async {
                await ref.read(authRepositoryProvider).signOut();
              },
            ),
          ),
        ],
      ),
      body: navigationShell,
      bottomBar: GlassTabBar.bottom(
        settings: LiquidGlassSettings.ios27Light,
        selectedIndex: navigationShell.currentIndex,
        onTabSelected: _goBranch,
        labelFontSize: 9.5,
        selectedLabelStyle: const TextStyle(
          fontSize: 9.5,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0F172A),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 9.5,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.normal,
          color: Color(0xFF64748B),
        ),
        tabs: const [
          GlassTab(
            icon: Icon(LucideIcons.layoutDashboard),
            label: 'Dashboard',
          ),
          GlassTab(
            icon: Icon(LucideIcons.folderKanban),
            label: 'Projects',
          ),
          GlassTab(
            icon: Icon(LucideIcons.calendar),
            label: 'Meetings',
          ),
          GlassTab(
            icon: Icon(LucideIcons.sparkles),
            label: 'Ask AI',
          ),
        ],
      ),
    );
  }
}
