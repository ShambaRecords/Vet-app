import 'package:flutter/material.dart';
import 'package:vet_app/data/config.dart';
import 'package:vet_app/data/data_source.dart';
import 'package:vet_app/model/appointment_model.dart';
import 'package:vet_app/model/payments_model.dart';
import 'package:vet_app/res/colors/colors.dart';
import 'package:vet_app/res/decorations/nm-file.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  TextEditingController dobControllerStartDate = new TextEditingController();
  TextEditingController dobControllerEndDate = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _noAppointmentsMessage = "Choose dates between March 1 to March 30 to generate report";

  int _totalFees = 0;
  int _totalCanceledAppointments = 0;
  int _totalPendingAppointments = 0;

  List<Appointment> appointmentsList = generateAppointments();
  List<Appointment> filteredAppointments = [];
  List<Appointment> completedAppointments = [];

  Future<void> _selectDate(BuildContext context, int selection) async {
    DateTime currentDate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(currentDate.year, currentDate.month, currentDate.day),
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(currentDate.year + 10, currentDate.month, currentDate.day));
    if (picked != null && picked != currentDate)
      setState(() {
        currentDate = picked;

        String dateText = Config.dateToString(currentDate);
        (selection == 0) ? dobControllerStartDate.text = dateText: dobControllerEndDate.text = dateText;
      });
  }

  Future<void> generateReport () async {
    // Clear existing records from report
    filteredAppointments.clear();
    completedAppointments.clear();
    _totalPendingAppointments = 0;
    _totalCanceledAppointments = 0;
    _totalFees = 0;

    // Find items that match criteria and add them to filtered list
    appointmentsList.forEach((element) {
      if (element.dateTime.isAfter(Config.stringToDate(dobControllerStartDate.text))
          && element.dateTime.isBefore(Config.stringToDate(dobControllerEndDate.text))){
        setState(() {
          filteredAppointments.add(element);

          switch (element.appointmentStatus) {
            case "pending":
              _totalPendingAppointments += 1;
              break;
            case "completed":
              completedAppointments.add(element);
              break;
            case "cancelled":
              _totalCanceledAppointments += 1;
              break;
          }

        });
      }
    });

    if (filteredAppointments.length == 0) {
      setState(() {
        _noAppointmentsMessage = "No appointments match that criteria";
      });
    } else {
      getTotalFeesCollected();
    }
  }

  void getTotalFeesCollected() {
    List<Payment> payments = generatePayments();

    completedAppointments.forEach((appointment) {
      payments.forEach((payment) {
        if (payment.appointmentId == appointment.id){
          setState(() {
            _totalFees += payment.amountPaid;
          });
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.all(20),
            decoration: nMbox,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Generate Report",
                    style: TextStyle(
                        color: colorGrayDarker,
                        fontWeight: FontWeight.w700,
                        fontSize: 26
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    cursorColor: colorPrimary,
                    enabled: true,
                    controller: dobControllerStartDate,
                    keyboardType: TextInputType.datetime,
                    validator: (value) => Config.validateDob(value),
                    onTap: (){
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectDate(context, 0);
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.calendar_today_sharp,
                        size: 22.0,
                        color: colorPrimary,
                      ),
                      labelText: 'Start Date',
                      labelStyle: TextStyle(
                        color: colorPrimary,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    cursorColor: colorPrimary,
                    enabled: true,
                    controller: dobControllerEndDate,
                    keyboardType: TextInputType.datetime,
                    validator: (value) => Config.validateDob(value),
                    onTap: (){
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectDate(context, 1);
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.calendar_today_sharp,
                        size: 22.0,
                        color: colorPrimary,
                      ),
                      labelText: 'End Date',
                      labelStyle: TextStyle(
                        color: colorPrimary,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){
                        if (_formKey.currentState.validate()){
                          print("I was clicked");
                          generateReport();
                        }
                      },
                      child: Text(
                        "Generate Report",
                        style: TextStyle(
                            color: colorWhite,
                            fontSize: 18
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // Hide overview until after
        filteredAppointments.length > 0 ? SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(20),
            decoration: nMbox,
            child: Column(
              children: <Widget>[
                Text(
                  "Report Details",
                  style: TextStyle(
                      color: colorGrayDarker,
                      fontWeight: FontWeight.w700,
                      fontSize: 26
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: nMboxInvert,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total Appointments: ${filteredAppointments.length}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Total Fees: $_totalFees",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colorStatusSuccessful,
                            ),
                            child: Text(
                              "COMPLETED: ${completedAppointments.length}",
                              style: TextStyle(
                                fontSize: 12,
                                color: colorWhite,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colorStatusPending,
                            ),
                            child: Text(
                              "PENDING: $_totalPendingAppointments",
                              style: TextStyle(
                                fontSize: 12,
                                color: colorWhite,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: colorStatusDeclined,
                            ),
                            child: Text(
                              "CANCELED: $_totalCanceledAppointments",
                              style: TextStyle(
                                fontSize: 12,
                                color: colorWhite,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ) : SliverToBoxAdapter(child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0x42ffff40),
          ),
          child: Center(
            child: Text(
              _noAppointmentsMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ),
        )),
        filteredAppointments.length > 0 ? SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: nMbox,
            child: Column(
              children: <Widget>[
                Text(
                  "Appointments",
                  style: TextStyle(
                      color: colorGrayDarker,
                      fontWeight: FontWeight.w700,
                      fontSize: 26
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(filteredAppointments.length, (index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          padding: EdgeInsets.all(0),
                          decoration: nMbox,
                          child: Row(
                            children: [
                              InkWell(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/icons/${Config.returnAnimalIcon(filteredAppointments[index].animalName)}",
                                                ),
                                                fit: BoxFit.scaleDown
                                            )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          filteredAppointments[index].ownerName,
                                          style:
                                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            Config.dateToString(filteredAppointments[index].dateTime),
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
                  }),
                )
              ],
            ),
          ),
        ) : SliverToBoxAdapter(child: Container(),),
      ],
    );
  }
}
