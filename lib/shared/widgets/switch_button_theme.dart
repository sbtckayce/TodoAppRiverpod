import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/pallete.dart';

class SwitchButtonTheme extends ConsumerWidget {
  const SwitchButtonTheme({super.key});
  toggleTheme(WidgetRef ref) {
    ref.read(themeProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Switch.adaptive(
      value: ref.watch(themeProvider.notifier).eThemeMode == EThemeMode.dark,
      onChanged: (val) => toggleTheme(ref),
    );
    ;
  }
}
