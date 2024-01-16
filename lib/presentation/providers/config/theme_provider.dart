import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantify/config/theme/app_theme.dart';

//Un objeto de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeController, AppTheme>(
  (ref) => ThemeController(),
);

class ThemeController extends StateNotifier<AppTheme> {
  ThemeController() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
  }
}
