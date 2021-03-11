import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vet_app/data/model/freezed_classes.dart';
import 'package:vet_app/domain/providers/home/payments_provider.dart';
import 'package:vet_app/res/styles.dart';

class ReportsPage extends HookWidget {
  // final Map<String, double> dataMap = {
  //   "Preventive medicine": 3000,
  //   "Surgery": 50000,
  //   "Euthanasia": 5000,
  //   "Protocol Vaccinations": 30000,
  // };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payments = useProvider(filteredPaymentsStreamProvider);

    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height * 0.79,
            width: size.width,
            child: payments.when(
                data: (data) {
                  print("data is $data");
                  if (data.docs.isEmpty) {
                    return Text("No data found for the current selection");
                  }

                  List<Payment> currentPayments = [];
                  for (var document in data.docs) {
                    Payment newPayment = Payment.fromJson(document.data()!);
                    currentPayments.add(newPayment);
                  }

                  Map<String, double> breakdown = {
                    for (var payment in currentPayments) ...{
                      payment.service!: payment.amount!
                    }
                  };

                  return ListView(
                    children: [
                      PieChart(
                        dataMap: breakdown,
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
                  );
                },
                loading: () {
                  return Center(
                    child: PlatformCircularProgressIndicator(),
                  );
                },
                error: (error, stack) {})),
      ),
    );
  }
}
