import 'package:flutter/material.dart';
import '../../data/models/consumption.dart';
import '../../data/repositories/consumption_repository.dart';

class ConsumptionProvider with ChangeNotifier {
  final ConsumptionRepository _repository = ConsumptionRepository();
  List<CigaretteConsumption> _consumptions = [];

  List<CigaretteConsumption> get consumptions => _consumptions;

  Future<void> loadConsumptions() async {
    _consumptions = await _repository.loadConsumption();
    notifyListeners();
  }

  Future<void> addConsumption(CigaretteConsumption consumption) async {
    await _repository.saveConsumption(consumption);
    _consumptions.add(consumption);
    notifyListeners();
  }

  /// Nueva función: Filtrar por rango de fechas
  List<CigaretteConsumption> filterByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return _consumptions
        .where(
          (consumption) =>
              consumption.dateTime.isAfter(startDate) &&
              consumption.dateTime.isBefore(endDate),
        )
        .toList();
  }

  /// Nueva función: Obtener conteo diario de cigarrillos
  Map<String, int> getDailyCounts() {
    Map<String, int> dailyCounts = {};

    for (var consumption in _consumptions) {
      String day =
          consumption.dateTime.toIso8601String().split(
            'T',
          )[0]; // Formato: YYYY-MM-DD
      if (dailyCounts.containsKey(day)) {
        dailyCounts[day] = dailyCounts[day]! + 1;
      } else {
        dailyCounts[day] = 1;
      }
    }
    return dailyCounts;
  }

  /// Nueva función: Obtener conteo semanal (últimos 7 días)
  Map<String, int> getWeeklyCounts() {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));

    final recentConsumptions = filterByDateRange(sevenDaysAgo, now);

    Map<String, int> weeklyCounts = {};

    for (var consumption in recentConsumptions) {
      String day = consumption.dateTime.toIso8601String().split('T')[0];
      if (weeklyCounts.containsKey(day)) {
        weeklyCounts[day] = weeklyCounts[day]! + 1;
      } else {
        weeklyCounts[day] = 1;
      }
    }
    return weeklyCounts;
  }

  /// Nueva función: Obtener conteo mensual (últimos 30 días)
  Map<String, int> getMonthlyCounts() {
    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));

    final recentConsumptions = filterByDateRange(thirtyDaysAgo, now);

    Map<String, int> monthlyCounts = {};

    for (var consumption in recentConsumptions) {
      String day = consumption.dateTime.toIso8601String().split('T')[0];
      if (monthlyCounts.containsKey(day)) {
        monthlyCounts[day] = monthlyCounts[day]! + 1;
      } else {
        monthlyCounts[day] = 1;
      }
    }
    return monthlyCounts;
  }

  /// Nueva función: Obtener promedio diario (últimos 30 días)
  double getAverageDailyConsumption() {
    final monthlyCounts = getMonthlyCounts();

    if (monthlyCounts.isEmpty) return 0;

    int totalCigarettes = monthlyCounts.values.reduce((a, b) => a + b);
    int daysCounted = monthlyCounts.keys.length;

    return totalCigarettes / daysCounted;
  }
}
