import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prices(Demo)',style: TextStyle(fontFamily: "Raleway"),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPriceCard(
                title: 'Stock Price',
                price: 1500, // Example value, replace with real data
                percentageChange: 2.5, // Example value, replace with real data
                graphData: _generateRandomData(), // Example data, replace with real data
              ),
              const SizedBox(height: 20),
              _buildPriceCard(
                title: 'Gold Price',
                price: 1800, // Example value, replace with real data
                percentageChange: -1.8, // Example value, replace with real data
                graphData: _generateRandomData(), // Example data, replace with real data
              ),
              const SizedBox(height: 20),
              _buildPriceCard(
                title: 'Goods Price',
                price: 300, // Example value, replace with real data
                percentageChange: 0.9, // Example value, replace with real data
                graphData: _generateRandomData(), // Example data, replace with real data
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceCard({
    required String title,
    required double price,
    required double percentageChange,
    required List<FlSpot> graphData,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '₹$price',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: percentageChange >= 0 ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change: ${percentageChange.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 16,
                    color: percentageChange >= 0 ? Colors.green : Colors.red,
                  ),
                ),
                const Text(
                  '1M',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: graphData,
                      isCurved: true,
                      colors: [Colors.blueGrey],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  gridData: FlGridData(
                    show: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _generateRandomData() {
    // Generate random data for demonstration
    final List<FlSpot> data = [];
    for (int i = 0; i < 7; i++) {
      data.add(FlSpot(i.toDouble(), 20 + i.toDouble()));
    }
    return data;
  }
}
