import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windows_explorer/models/explorer_tab.dart';
import 'package:windows_explorer/riverpod/providers.dart';
import 'package:windows_explorer/widgets/tab_widget.dart';

class ExplorerTabView extends ConsumerWidget {
  const ExplorerTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      ...tabs.map((e) {
        return Flexible(
          child: Container(
            constraints: const BoxConstraints(minWidth: 150),
            child: TabWidget(
              tab: e,
            ),
          ),
        );
      }).toList(),
      IconButton(
          onPressed: () =>
              ref.read(tabsProvider.notifier).addTab(ExplorerTab(path: "Home")),
          icon: const Icon(Icons.add))
    ]);
  }
}
