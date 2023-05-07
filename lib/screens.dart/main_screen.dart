import 'package:flutter/material.dart';
import 'package:windows_explorer/widgets/title_bar.dart';
import 'package:windows_explorer/widgets/top_action_row.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List dummyFavorites = [
    {
      "name": "Downloads",
      "icon": Icons.download_rounded,
      "path": "C:\\Users\\user\\Downloads"
    },
    {
      "name": "Documents",
      "icon": Icons.document_scanner_rounded,
      "path": "C:\\Users\\user\\Documents"
    },
    {
      "name": "Pictures",
      "icon": Icons.image_rounded,
      "path": "C:\\Users\\user\\Pictures"
    },
    {
      "name": "Videos",
      "icon": Icons.video_collection_rounded,
      "path": "C:\\Users\\user\\Videos"
    },
    {
      "name": "Music",
      "icon": Icons.music_note_rounded,
      "path": "C:\\Users\\user\\Music"
    },
    {
      "name": "Desktop",
      "icon": Icons.desktop_windows_rounded,
      "path": "C:\\Users\\user\\Desktop"
    },
    {"name": "Local Disk (C:)", "icon": Icons.storage_rounded, "path": "C:\\"},
    {"name": "Local Disk (D:)", "icon": Icons.storage_rounded, "path": "D:\\"},
  ];

  final scrollController = ScrollController();
  int railIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TitleBar(),
          const Divider(
            height: 0,
            thickness: 1.5,
          ),
          const TopActionBar(),
          const Divider(
            height: 0,
            thickness: 1.5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Scrollbar(
                      thumbVisibility: true,
                      controller: scrollController,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: NavigationRail(
                                extended: true,
                                minExtendedWidth: 200,
                                destinations: dummyFavorites.map((e) {
                                  return NavigationRailDestination(
                                      icon: Icon(e["icon"]),
                                      label: Text(e["name"]));
                                }).toList(),
                                selectedIndex: railIndex,
                                onDestinationSelected: (value) {
                                  setState(() {
                                    railIndex = value;
                                  });
                                }),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
