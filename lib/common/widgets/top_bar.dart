import 'package:flutter/material.dart';
import 'package:no_more_smoke/common/assets_manager.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.showBackIcon,
  }) : super(key: key);

  final bool showBackIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Stack(
          children: [
            Center(
              child: Hero(
                tag: "tag",
                child: Image.asset(
                  AssetsManager.icon,
                  width: 65,
                  height: 65,
                ),
              ),
            ),
            Visibility(
              visible: showBackIcon,
              child: Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
