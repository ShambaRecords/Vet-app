import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PaymentsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: Text("M-Pesa Payment - James Mark"),
                subtitle: Text("Ksh. 10,000"),
                leading: Icon(Icons.payment),
              ),
              ListTile(
                title: Text("M-Pesa Payment - John Muindi"),
                subtitle: Text("Ksh. 8,000"),
                leading: Icon(Icons.payment),
              ),
              ListTile(
                title: Text("Credit Card Payment - Emily Karisa"),
                subtitle: Text("Ksh. 10,000"),
                leading: Icon(Icons.payment),
              )
            ],
          ),
        ),
      ),
    );
  }
}
