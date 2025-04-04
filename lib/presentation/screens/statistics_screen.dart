import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../providers/consumption_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConsumptionProvider>(context);

    // Retrieve statistics from the provider
    final dailyCounts = provider.getDailyCounts();
    final weeklyCounts = provider.getWeeklyCounts();
    final monthlyCounts = provider.getMonthlyCounts();
    final averageDailyConsumption = provider.getAverageDailyConsumption();

    // Prepare bar chart data for daily consumption
    List<BarChartGroupData> dailyBarGroups = [];
    int index = 0;

    dailyCounts.forEach((day, count) {
      dailyBarGroups.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              y: count.toDouble(), // ✅ Correct usage of `y`
              width: 16,
              borderSide: BorderSide(
                color: Colors.blue,
              ), // ✅ Using `borderSide` for styling
            ),
          ],
        ),
      );
      index++;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Average Daily Consumption: ${averageDailyConsumption.toStringAsFixed(2)} cigarettes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Daily Bar Chart
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: dailyBarGroups,
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitles: (double value) {
                        if (value.toInt() >= dailyCounts.keys.length) return '';
                        final date = dailyCounts.keys.elementAt(value.toInt());
                        return date.substring(
                          5,
                        ); // Display month and day only (MM-DD)
                      },
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(enabled: true),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Weekly Report
            Text(
              'Last 7 days consumption: ${weeklyCounts.values.isNotEmpty ? weeklyCounts.values.reduce((a, b) => a + b) : 0} cigarettes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),

            // Monthly Report
            Text(
              'Last 30 days consumption: ${monthlyCounts.values.isNotEmpty ? monthlyCounts.values.reduce((a, b) => a + b) : 0} cigarettes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
