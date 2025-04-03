import 'dart:async';
import 'package:flutter/material.dart';
import 'package:no_more_smoke/common/text_providers/text_provider_en.dart';

class CountupClock extends StatefulWidget {
  const CountupClock({super.key, required this.targetDateTime});

  final DateTime targetDateTime;

  @override
  CountupClockState createState() => CountupClockState();
}

class CountupClockState extends State<CountupClock> {
  late Timer _timer;

  String _getCountupTime() {
    final now = DateTime.now();
    final difference = now.difference(widget.targetDateTime);

    final days = difference.inDays.abs();
    final hours = difference.inHours.abs() % 24;
    final minutes = difference.inMinutes.abs() % 60;
    final seconds = difference.inSeconds.abs() % 60;

    return "$days ${TextProvider.days} $hours ${TextProvider.hours} $minutes ${TextProvider.minutes} $seconds ${TextProvider.seconds}";
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getCountupTime(),
      style: const TextStyle(fontSize: 16.0),
    );
  }
}
