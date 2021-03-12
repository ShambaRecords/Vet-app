import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/domain/blocs/appointment_bloc.dart';
import 'package:vet_app/util/ui/datetimeutil.dart';

/// Form field template in the register page
Widget formField(
  BuildContext context,
  String label,
  bool isText, {
  String? prefix,
  AppointmentBloc? bloc,
  Function(String)? onChanged,
  String? error,
  String? currentText,
  bool? obscureText,
  Widget? suffixIcon,
}) {
  return Column(children: [
    Padding(padding: EdgeInsets.only(top: 10)),
    PlatformTextField(
      material: (context, platform) => MaterialTextFieldData(
        readOnly: label == "DOB",
        obscureText: obscureText,
        keyboardType: isText ? TextInputType.text : TextInputType.phone,
        onTap: () async {
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          border: OutlineInputBorder(),
          labelText: label,
          errorText: error,
          hintText: currentText,
          prefixText: prefix ?? prefix,
          suffixIcon: suffixIcon ?? suffixIcon,
        ),
      ),
    ),
  ]);
}