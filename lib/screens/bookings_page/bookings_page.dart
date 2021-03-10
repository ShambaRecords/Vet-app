import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BookingsPage extends HookWidget {
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
                title: Text("January 1st"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10.00am - 11.00am"),
                    Text("Anne Mele"),
                    Text("Animal: Dog"),
                    Text("Species: Carne Corso"),
                    Text("Regular Check up"),
                  ],
                ),
                leading: Icon(Icons.calendar_today_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
