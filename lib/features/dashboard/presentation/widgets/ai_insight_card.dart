import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class AiInsightCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onActionPressed;
  final String? actionText;

  const AiInsightCard({
    super.key,
    required this.title,
    required this.description,
    this.icon = LucideIcons.sparkles,
    this.iconColor = const Color(0xFF3B82F6),
    this.onActionPressed,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F172A),
                        ),
                  ),
                ),
                const Icon(
                  LucideIcons.moreHorizontal,
                  color: Color(0xFF64748B),
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF64748B),
                  ),
            ),
            if (actionText != null && onActionPressed != null) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onActionPressed,
                  icon: const Icon(LucideIcons.arrowRight, size: 16, color: Color(0xFF1E3A8A)),
                  label: Text(actionText!, style: const TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.w600)),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
