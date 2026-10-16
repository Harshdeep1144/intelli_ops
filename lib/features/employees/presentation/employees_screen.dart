import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

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
              'Team Members',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            GlassCard(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(LucideIcons.user)),
                title: const Text('Alex Johnson', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                subtitle: const Text('Lead Developer', style: TextStyle(color: Color(0xFF64748B))),
                trailing: const Text('Online', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            GlassCard(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(LucideIcons.user)),
                title: const Text('Sarah Connor', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                subtitle: const Text('Product Manager', style: TextStyle(color: Color(0xFF64748B))),
                trailing: const Text('In Meeting', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
