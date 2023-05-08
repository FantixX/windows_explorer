import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windows_explorer/riverpod/providers.dart';

class DirectoryView extends ConsumerWidget {
  const DirectoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(directoryContentsProvider("C:\\Users\\laabe\\Downloads"))
        .when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(data[index].path.split("\\").last));
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
