import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({super.key});

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
              'Scheduled Meetings',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            GlassCard(
              child: ListTile(
                leading: const Icon(LucideIcons.calendar, color: Colors.blueAccent),
                title: const Text('Q3 Planning Session', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                subtitle: const Text('Today, 2:00 PM - 3:00 PM', style: TextStyle(color: Color(0xFF64748B))),
                trailing: Chip(
                  backgroundColor: Colors.blue.withValues(alpha: 0.1),
                  label: const Text('Upcoming', style: TextStyle(color: Color(0xFF1E3A8A))),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GlassCard(
              child: ListTile(
                leading: const Icon(LucideIcons.video, color: Colors.purpleAccent),
                title: const Text('Sprint Retro & Demo', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                subtitle: const Text('Tomorrow, 10:00 AM - 11:00 AM', style: TextStyle(color: Color(0xFF64748B))),
                trailing: Chip(
                  backgroundColor: Colors.purple.withValues(alpha: 0.1),
                  label: const Text('Scheduled', style: TextStyle(color: Color(0xFF6B21A8))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
