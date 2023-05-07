import 'package:flutter/material.dart';
import 'package:windows_explorer/widgets/thememode_selector.dart';

class TopActionBar extends StatelessWidget {
  const TopActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_constructors
      children: const [ThemeModeSelector()],
    );
  }
}
