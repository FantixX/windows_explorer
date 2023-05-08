import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:windows_explorer/riverpod/providers.dart';

class DirectoryView extends ConsumerStatefulWidget {
  const DirectoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DirectoryViewState();
}

class _DirectoryViewState extends ConsumerState<DirectoryView> {
  int? selectedFileIndex;

  Future<FileSystemEntityType> getType(FileSystemEntity reference) async {
    final type = await FileSystemEntity.type(reference.path);
    return type;
  }

  Icon getTypeIcon(FileSystemEntityType type) {
    switch (type) {
      case FileSystemEntityType.directory:
        return Icon(
          Icons.folder,
          color: Colors.amber,
        );
      case FileSystemEntityType.file:
        return Icon(Icons.insert_drive_file);
      case FileSystemEntityType.link:
        return Icon(Icons.link);
      default:
        return Icon(Icons.insert_drive_file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(currentDirectoryContentsProvider).when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final reference = data[index];
                return FutureBuilder(
                    future: getType(reference),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final type = snapshot.data as FileSystemEntityType;
                        return InkWell(
                            splashColor: Colors.transparent,
                            onDoubleTap: () {
                              if (type == FileSystemEntityType.directory) {
                                ref
                                    .read(tabsProvider.notifier)
                                    .setTabPath(reference.path);
                              } else if (type == FileSystemEntityType.file) {
                                OpenFile.open(reference.path);
                              }
                            },
                            child: Listener(
                              onPointerDown: (event) {
                                setState(() {
                                  selectedFileIndex = index;
                                });
                              },
                              //TODO LOOK INTO WHY UMLAUTE CAUSE ERROR ON URL LAUNCH
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: getTypeIcon(snapshot.data!),
                                ),
                                title: Text(data[index].path.split("\\").last),
                                selected: selectedFileIndex == index,
                                selectedTileColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                            ));
                      }
                      return SizedBox();
                    });
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
