import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantify/presentation/providers/providers.dart';
import 'package:plantify/presentation/widgets/widgets.dart';

class ConfigView extends ConsumerWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: const CustomAppbar(title: 'Ajustes'),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(
            height: 5,
          ),
          SwitchListTile(
            title: const Text(
              'Modo oscuro',
            ),
            value: isDarkMode,
            onChanged: (value) {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
    );
  }
}