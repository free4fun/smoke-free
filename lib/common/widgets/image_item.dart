import 'package:flutter/material.dart';

class FullscreenImage extends StatelessWidget {
  final String pic;

  const FullscreenImage({super.key, required this.pic});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.black.withOpacity(0.8),
        child: Image.asset(
          pic,
          fit: BoxFit.scaleDown,
        ));
  }
}
