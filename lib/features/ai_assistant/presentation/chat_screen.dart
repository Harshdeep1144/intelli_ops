import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom + 100;
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'AI Assistant',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF0F172A),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    GlassCard(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Hello Alex! How can I assist you with project planning or team resource allocation today?',
                          style: TextStyle(color: Color(0xFF0F172A)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(
                    child: GlassTextField(
                      placeholder: 'Ask AI Assistant...',
                    ),
                  ),
                  const SizedBox(width: 8),
                  GlassIconButton(
                    icon: const Icon(LucideIcons.send, color: Color(0xFF0F172A)),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
