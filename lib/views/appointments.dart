import 'package:flutter/material.dart';
import 'package:vet_app/data/config.dart';
import 'package:vet_app/data/data_source.dart';
import 'package:vet_app/model/appointment_model.dart';
import 'package:vet_app/res/colors/colors.dart';
import 'package:vet_app/res/decorations/nm-file.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    List<Appointment> _appointmentsList = generateAppointments();

    DateTime previousDate;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              DateTime thisDate = _appointmentsList[index].dateTime;
              bool showDate;

              if (previousDate == null) {
                previousDate = thisDate;
                showDate = true;
              } else {
                if (Config.dateToString(previousDate) == Config.dateToString(thisDate)) {
                  showDate = false;
                } else {
                  previousDate = thisDate;
                  showDate = true;
                }
              }

              return Column(
                children: [
                  showDate ? Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorSecondary,
                    ),

                    child: Text(
                      Config.dateToString(thisDate),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ) : SizedBox(),
                  GestureDetector(
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
                                                "assets/icons/${Config.returnAnimalIcon(_appointmentsList[index].animalName)}",
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
                                        _appointmentsList[index].ownerName,
                                        style:
                                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _appointmentsList[index].animalName.substring(0,1).toUpperCase() +
                                            _appointmentsList[index].animalName.substring(1),
                                        style:
                                        TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          Config.dateToStringWithTime(thisDate),
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
                  )
                ],
              );
            },
            childCount: _appointmentsList.length,
          ),
        )
      ],
    );
  }
}
