import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windows_explorer/models/explorer_tab.dart';
import 'package:windows_explorer/riverpod/tabs_notifier.dart';

import '../utility/app_settings_utility.dart';

final appSettingsProvider = Provider<AppSettingsUtility>((ref) {
  return AppSettingsUtility();
});

final tabsProvider = NotifierProvider<TabsNotifier, List<ExplorerTab>>(() {
  return TabsNotifier();
});
