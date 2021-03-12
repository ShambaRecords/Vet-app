import 'package:flutter/material.dart';
import 'package:vet_app/data/config.dart';
import 'package:vet_app/data/data_source.dart';
import 'package:vet_app/model/payments_model.dart';
import 'package:vet_app/res/decorations/nm-file.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    List<Payment> _paymentList = generatePayments();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "All payments",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              DateTime thisDate = _paymentList[index].date;
              String dateString = thisDate.toLocal().toString();
              return GestureDetector(
                onTap: (){},
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(5),
                    decoration: nMbox,
                    child: Row(
                      children: [
                        InkWell(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    Config.dateToStringWithTime(_paymentList[index].date),
                                    style:
                                    TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "Amount: " + _paymentList[index].amountPaid.toString(),
                                      style: TextStyle(
                                          fontSize: 15, color: Color(0xFF000000).withOpacity(0.7)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              );
            },
            childCount: _paymentList.length,
          ),
        )
      ],
    );
  }
}
