import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windows_explorer/riverpod/providers.dart';
import 'package:windows_explorer/widgets/thememode_selector.dart';

class TopActionBar extends ConsumerWidget {
  const TopActionBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        const ThemeModeSelector(),
        IconButton(
            onPressed: () => ref.read(tabsProvider.notifier).pathUp(),
            icon: Icon(Icons.drive_folder_upload))
      ],
    );
  }
}
