import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'widgets/ai_insight_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning, Alex',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Here is your intelligent overview for today.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF64748B),
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'AI Insights',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              const AiInsightCard(
                title: 'Project Delay Risk',
                description:
                    'The "Mobile App Redesign" project is trending 2 days behind schedule based on recent task completion rates. Recommend re-allocating 1 developer.',
                icon: LucideIcons.alertTriangle,
                iconColor: Colors.amber,
                actionText: 'Review Project',
              ),
              const AiInsightCard(
                title: 'Meeting Summary Ready',
                description:
                    'The transcript and action items for "Q3 Planning" have been generated. 3 tasks need assignment.',
                icon: LucideIcons.fileText,
                iconColor: Colors.green,
                actionText: 'View Summary',
              ),
              const AiInsightCard(
                title: 'Resource Optimization',
                description:
                    'Sarah has completed all her sprint tasks early. There are 2 high-priority tasks in the backlog she could pick up.',
                actionText: 'Assign Tasks',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
