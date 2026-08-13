import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/navigation/main_navigation.dart';
import 'data/providers.dart';

void main() {
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
