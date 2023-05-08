import 'package:flutter/material.dart';

class SideRail extends StatefulWidget {
  const SideRail({super.key});

  @override
  State<SideRail> createState() => SideRailState();
}

class SideRailState extends State<SideRail> {
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: NavigationRail(
                    extended: true,
                    minExtendedWidth: 200,
                    destinations: dummyFavorites.map((e) {
                      return NavigationRailDestination(
                          icon: Icon(e["icon"]), label: Text(e["name"]));
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
    );
  }
}
