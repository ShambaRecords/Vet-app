import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vet_app/res/styles.dart';

class ReportsPage extends HookWidget {
  final Map<String, double> dataMap = {
    "Preventive medicine": 3000,
    "Surgery": 50000,
    "Euthanasia": 5000,
    "Protocol Vaccinations": 30000,
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.79,
          width: size.width,
          child: ListView(
            children: [
              PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width * 0.80,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 3,
                centerText: "Services",
                legendOptions: LegendOptions(
                  showLegendsInRow: true,
                  legendPosition: LegendPosition.bottom,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
              ),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
              Text("some text"),
            ],
          ),
        ),
      ),
    );
  }
}
