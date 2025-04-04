// lib/presentation/screens/tracking_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../l10n/generated/app_localizations.dart';
import '../providers/consumption_provider.dart';
import '../../data/models/consumption.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConsumptionProvider>(context);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.registerConsumption)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.consumptions.length,
              itemBuilder: (context, index) {
                final consumption = provider.consumptions[index];
                final formattedTime = DateFormat(
                  'hh:mm a',
                ).format(consumption.dateTime);

                return ListTile(
                  title: Text(loc.cigaretteLogged(formattedTime)),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final consumption = CigaretteConsumption(
                dateTime: DateTime.now(),
              );
              provider.addConsumption(consumption);
            },
            child: Text(loc.registerConsumption),
          ),
        ],
      ),
    );
  }
}
