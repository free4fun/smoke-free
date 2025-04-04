// lib/data/repositories/consumption_repository.dart

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/consumption.dart';

class ConsumptionRepository {
  static const String _key = 'cigarette_consumption';

  Future<void> saveConsumption(CigaretteConsumption consumption) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> storedData = prefs.getStringList(_key) ?? [];

    storedData.add(jsonEncode(consumption.toJson()));
    await prefs.setStringList(_key, storedData);
  }

  Future<List<CigaretteConsumption>> loadConsumption() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> storedData = prefs.getStringList(_key) ?? [];

    return storedData
        .map((item) => CigaretteConsumption.fromJson(jsonDecode(item)))
        .toList();
  }

  Future<List<CigaretteConsumption>> loadConsumptionByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final allConsumptions = await loadConsumption();
    return allConsumptions
        .where(
          (consumption) =>
              consumption.dateTime.isAfter(startDate) &&
              consumption.dateTime.isBefore(endDate),
        )
        .toList();
  }
}
