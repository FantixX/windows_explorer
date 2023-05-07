import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_explorer/models/explorer_tab.dart';

class TabsNotifier extends Notifier<List<ExplorerTab>> {
  @override
  build() {
    return [ExplorerTab(path: "Home", isCurrent: true)];
  }

  void addTab(ExplorerTab tab) {
    ExplorerTab addedTab = tab;
    if (state.isEmpty) addedTab.isCurrent = true;
    state = [...state, addedTab];
  }

  void removeTab(ExplorerTab tab) {
    if (tab.isCurrent) {
      final nextIndex = state.indexOf(tab);
      try {
        state = [...state]..[nextIndex + 1].isCurrent = true;
      } catch (e) {
        try {
          state = [...state]..[nextIndex - 1].isCurrent = true;
        } catch (e) {
          windowManager.close();
        }
      }
    }
    state = [...state]..remove(tab);
  }

  void setCurrentTab(ExplorerTab tab) {
    state = [...state]..forEach((element) => element.isCurrent = false);
    state = [...state]..firstWhere((element) => element == tab).isCurrent =
        true;
  }
}
