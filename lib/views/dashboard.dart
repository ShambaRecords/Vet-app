import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:vet_app/data/config.dart';
import 'package:vet_app/data/data_source.dart';
import 'package:vet_app/model/appointment_model.dart';
import 'package:vet_app/res/colors/colors.dart';
import 'package:vet_app/res/decorations/nm-file.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Appointment> _appointmentsList = generateAppointments();


  @override
  Widget build(BuildContext context) {
    List<String> list = ["9:00", "10:00", "11:00", "12:00", "1:00", "2:00", "3:00"];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: colorSecondary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Dr. Kowalski",
                  style: TextStyle(
                    color: colorText,
                    fontSize: 38,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(5),
            height: 100,
            decoration: nMbox,
            child: Column(
              children: <Widget>[
                Text(
                  "Today's Overview",
                  style: TextStyle(
                      color: colorGrayDarker,
                      fontWeight: FontWeight.w700,
                      fontSize: 26
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: nMbox,
            child: Column(
              children: [
                Text(
                  "Today's Appointments",
                  style: TextStyle(
                      color: colorGrayDarker,
                      fontWeight: FontWeight.w700,
                      fontSize: 26
                  ),
                ),
                SizedBox(height: 10),
                LimitedBox(
                  maxHeight: 400,
                  child: ListView(
                    children: List.generate(_appointmentsList.length, (index) {
                      DateTime thisDate = _appointmentsList[index].dateTime;
                      String dateString = thisDate.toLocal().toString();
                      return TimelineTile(
                        indicatorStyle: IndicatorStyle(
                          width: 18,
                        ),
                        hasIndicator: true,
                        isFirst: index == 0,
                        isLast: index == _appointmentsList.length - 1,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.16,
                        endChild: Column(
                          children: List.generate(1, (anotherIndex) {
                            return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                padding: EdgeInsets.all(5),
                                decoration: nMboxInvert,
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
                                              SizedBox(
                                                child: Text(
                                                  dateString,
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
                            );
                          }),
                        ),
                        startChild: Center(
                          child: Text(
                            list[index],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
          ),
        ),
      ],
    );
  }
}
