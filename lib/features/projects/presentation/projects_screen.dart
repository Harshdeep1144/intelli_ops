import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        top: true,
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              'Active Projects',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            GlassCard(
              child: ListTile(
                leading: const Icon(LucideIcons.smartphone, color: Colors.blueAccent),
                title: const Text('Mobile App Redesign', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                subtitle: const Text('UI/UX overhaul & glassmorphism update', style: TextStyle(color: Color(0xFF64748B))),
                trailing: Chip(
                  backgroundColor: Colors.blue.withValues(alpha: 0.1),
                  label: const Text('In Progress', style: TextStyle(color: Color(0xFF1E3A8A))),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GlassCard(
              child: ListTile(
                leading: const Icon(LucideIcons.cloud, color: Colors.purpleAccent),
                title: const Text('Cloud Infrastructure Migration', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                subtitle: const Text('Moving microservices to Kubernetes', style: TextStyle(color: Color(0xFF64748B))),
                trailing: Chip(
                  backgroundColor: Colors.purple.withValues(alpha: 0.1),
                  label: const Text('Planning', style: TextStyle(color: Color(0xFF6B21A8))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
