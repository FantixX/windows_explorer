import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_explorer/widgets/tab_view.dart';

import 'title_bar_windows_actions.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                    constraints:
                        BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
                    child: const ExplorerTabView()),
              ),
              const Expanded(
                child: DragToMoveArea(
                  child: SizedBox(
                    height: double.infinity,
                  ),
                ),
              ),
              Column(
                children: const [
                  WindowActions(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
