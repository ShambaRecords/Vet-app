import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vet_app/domain/providers/home/payments_provider.dart';
import 'package:vet_app/model/freezed_classes.dart';
import 'package:vet_app/res/styles.dart';
import 'package:vet_app/util/ui/datetimeutil.dart';

class ReportsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payments = useProvider(filteredPaymentsStreamProvider);
    final startTime = useProvider(startTimeProvider).state;
    final endTime = useProvider(endTimeProvider).state;

    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height * 0.79,
            width: size.width,
            child: Column(
              children: [
                Center(child: Text("Your Breakdown filtred from(Editable)")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Start Date",
                          style: TextStyle(fontSize: 14),
                        ),
                        OutlinedButton(
                          child: Text(
                              DateTimeUtils.getdd_MM_yyyy(startTime.toDate())),
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: startTime.toDate(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2030));
                            if (picked == null) return;
                            context.read(startTimeProvider).state =
                                Timestamp.fromDate(picked);
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "End Date",
                          style: TextStyle(fontSize: 14),
                        ),
                        OutlinedButton(
                          child: Text(
                              DateTimeUtils.getdd_MM_yyyy(endTime.toDate())),
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: endTime.toDate(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2030));
                            if (picked == null) return;
                            context.read(endTimeProvider).state =
                                Timestamp.fromDate(picked);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                payments.when(
                    data: (data) {
                      if (data.docs.isEmpty) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("No data found for the current selection"),
                            ),
                          ],
                        );
                      }

                      List<Payment> currentPayments = [];
                      for (var document in data.docs.where((element) =>
                          element.data()!['datetime'].compareTo(startTime) >
                              0 &&
                          element.data()!['datetime'].compareTo(endTime) < 0)) {
                        Payment newPayment = Payment.fromJson(document.data()!);
                        currentPayments.add(newPayment);
                      }

                      Map<String, double> breakdown = {};

                      for (var payment in currentPayments) {
                        if (breakdown.containsKey(payment.service)) {
                          breakdown[payment.service!] =
                              breakdown[payment.service!]! + payment.amount!;
                        } else {
                          breakdown[payment.service!] = payment.amount!;
                        }
                      }

                      Map<String?, List<Payment>> groupedPaymentMap = groupBy(
                          currentPayments,
                          (Payment payment) => payment.service);

                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(26.0),
                                    child: PieChart(
                                      dataMap: breakdown,
                                      animationDuration:
                                          Duration(milliseconds: 800),
                                      chartLegendSpacing: 32,
                                      chartRadius:
                                          MediaQuery.of(context).size.width *
                                              0.70,
                                      colorList: colorList,
                                      initialAngleInDegree: 0,
                                      chartType: ChartType.ring,
                                      ringStrokeWidth: 3,
                                      centerText: "Services paid for(Ksh)",
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(
                                        "Total: ${breakdown.values.reduce((value, element) => value + element)}"),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 20)),
                                  for (var key in breakdown.keys) ...[
                                    ExpansionTile(
                                      initiallyExpanded: true,
                                      title: Text(key),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            children: [
                                              for (Payment payment
                                                  in groupedPaymentMap[key]!) ...[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      DateTimeUtils.getdd_MM_yyyy(
                                                          payment.datetime!),
                                                      style:
                                                          TextStyle(fontSize: 16),
                                                    ),
                                                    Text(payment.user!),
                                                    Text(
                                                        "Ksh ${payment.amount!}"),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 4.0),
                                                ),
                                              ]
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                  Padding(
                                      padding: const EdgeInsets.only(top: 40)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () {
                      return Center(
                        child: PlatformCircularProgressIndicator(),
                      );
                    },
                    error: (error, stack) {
                      return Text("An error ocurred while loading your report");
                    }),
              ],
            )),
      ),
    );
  }
}
