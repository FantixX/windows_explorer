import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windows_explorer/models/explorer_tab.dart';
import 'package:windows_explorer/riverpod/tabs_notifier.dart';

import '../services/file_system_service.dart';
import '../utility/app_settings_utility.dart';

final appSettingsProvider = Provider<AppSettingsUtility>((ref) {
  return AppSettingsUtility();
});

final tabsProvider = NotifierProvider<TabsNotifier, List<ExplorerTab>>(() {
  return TabsNotifier();
});

final fileSystemServiceProvider = Provider<FileSystemService>((ref) {
  return FileSystemService();
});

final directoryContentsProvider =
    FutureProvider.family<List<FileSystemEntity>, String>((ref, path) {
  return ref.watch(fileSystemServiceProvider).dirContents(Directory(path));
});
