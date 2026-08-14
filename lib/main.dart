import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'core/navigation/main_navigation.dart';
import 'data/providers.dart';

void main() {
  // Any widget-build error (a bug in a screen, a data-mapping mistake, etc.)
  // renders as a friendly Bengali message instead of Flutter's default
  // blank/gray screen — a blank screen with no explanation is the worst
  // possible failure mode on a phone, since there's nothing to screenshot
  // and report.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      color: AppColors.lightBackground,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 40, color: AppColors.error),
              const SizedBox(height: 12),
              const Text(
                'কিছু একটা ভুল হয়েছে',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                details.exceptionAsString(),
                style: const TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  };

  runApp(const ProviderScope(child: BanglaSahityaApp()));
}

/// Central theme-mode state (Light / Dark). Reading Mode is applied
/// per-screen inside the Study feature, not globally, since it should
/// only affect long-form reading surfaces (spec section 25).
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class BanglaSahityaApp extends ConsumerWidget {
  const BanglaSahityaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = mode == ThemeMode.dark || (mode == ThemeMode.system && brightness == Brightness.dark);

    // Matches the Android bottom gesture bar / status bar to the app's own
    // theme instead of leaving it at the OS default (which showed up as a
    // stray white/gray strip under a dark-themed app).
    SystemChrome.setSystemUIOverlayStyle(
      isDark
          ? const SystemUiOverlayStyle(
              systemNavigationBarColor: AppColors.darkSurface,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              systemNavigationBarColor: AppColors.lightSurface,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
    );

    return MaterialApp(
      title: 'বাংলা সাহিত্য',
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: const Locale('bn', 'BD'),
      supportedLocales: const [Locale('bn', 'BD'), Locale('en', 'US')],
      home: const _AppStartup(),
    );
  }
}

/// Imports the bundled content pack(s) into the local database once, then
/// shows the normal app shell. Re-running the import on a later launch is
/// safe — see ContentImportService — so this gate is cheap and idempotent.
class _AppStartup extends ConsumerWidget {
  const _AppStartup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final importState = ref.watch(contentImportProvider);
    return importState.when(
      data: (_) => const MainNavigation(),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('কনটেন্ট লোড করতে সমস্যা হয়েছে:\n$err', textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
