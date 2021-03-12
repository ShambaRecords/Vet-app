import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/providers/home/payments_provider.dart';
import 'package:vet_app/model/freezed_classes.dart';

class PaymentsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payments = useProvider(paymentsStreamProvider);
    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.all(8.0),
            child: payments.when(
                data: (data) {
                  if (data.docs.isEmpty) {
                    return Text("No bookings available");
                  }

                  List<Payment> currentPayments = [];
                  for (var document in data.docs) {
                    Payment newPayment = Payment.fromJson(document.data()!);
                    currentPayments.add(newPayment);
                  }
                  return Column(
                    children: [
                      Text("Payments Recieved"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: [
                              for (var payment in currentPayments) ...[
                                ListTile(
                                  title: Text(
                                      "${payment.type} Payment - ${payment.user}"),
                                  subtitle: Text("Ksh. ${payment.amount}"),
                                  leading: Icon(Icons.payment),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () {
                  return Center(child: PlatformCircularProgressIndicator());
                },
                error: (error, stack) {})),
      ),
    );
  }
}
