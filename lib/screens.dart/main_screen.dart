import 'package:flutter/material.dart';
import 'package:windows_explorer/widgets/directory_view.dart';
import 'package:windows_explorer/widgets/side_rail.dart';
import 'package:windows_explorer/widgets/title_bar.dart';
import 'package:windows_explorer/widgets/top_action_row.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              children: [SideRail(), Expanded(child: DirectoryView())],
            ),
          )
        ],
      ),
    );
  }
}
