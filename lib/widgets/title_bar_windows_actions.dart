import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_explorer/widgets/windows_action.dart';

class WindowActions extends StatelessWidget {
  const WindowActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          WindowsAction(
              icon: Icons.minimize_rounded, onPressed: windowManager.minimize),
          WindowsAction(
              icon: Icons.crop_square_rounded,
              onPressed: () async {
                if (await windowManager.isMaximized()) {
                  windowManager.unmaximize();
                } else {
                  windowManager.maximize();
                }
              }),
          WindowsAction(
            hoverColor: Colors.red.withOpacity(0.7),
            icon: Icons.close_rounded,
            onPressed: windowManager.close,
            color: theme.colorScheme.error,
          ),
        ],
      ),
    );
  }
}
