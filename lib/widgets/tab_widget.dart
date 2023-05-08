import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windows_explorer/models/explorer_tab.dart';

import '../riverpod/providers.dart';

class TabWidget extends ConsumerWidget {
  final ExplorerTab tab;
  const TabWidget({super.key, required this.tab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCurrent = tab.isCurrent;
    return Card(
      color:
          (isCurrent) ? Theme.of(context).colorScheme.primaryContainer : null,
      //elevation: (isCurrent) ? 10 : null,
      child: InkWell(
        hoverColor: (isCurrent) ? Colors.transparent : null,
        onTap: (!isCurrent)
            ? () {
                ref.read(tabsProvider.notifier).setCurrentTab(tab);
              }
            : null,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 5, 10),
                  child: Text(
                    "${tab.path}\\",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 16,
                  ),
                  onTap: () {
                    ref.read(tabsProvider.notifier).removeTab(tab);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
