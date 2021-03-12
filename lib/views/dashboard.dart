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
  List<Appointment> appointmentsList = generateAppointments();
  List<Appointment> filteredAppointments = [];

  Future<void> getTodayAppointments () async {
    // Find today items and add them to filtered list
    appointmentsList.forEach((element) {
      if (Config.dateToString(element.dateTime) == "2021-03-12"){
        setState(() {
          filteredAppointments.add(element);
        });
      }
    });
  }


  @override
  void initState() {
    super.initState();

    // Get today's appointments
    getTodayAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55), bottomRight: Radius.circular(55)),
              color: colorSecondary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://randomuser.me/api/portraits/men/11.jpg"),
                          fit: BoxFit.cover)),
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Dr. Kimani",
                  style: TextStyle(
                    color: colorText,
                    fontSize: 38,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "You have ${filteredAppointments.length} appointments today "
                      "and your first appointment is at ${Config.dateToTimeString(filteredAppointments[0].dateTime)}.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorGrayDarker,
                      fontWeight: FontWeight.w400,
                      fontSize: 18
                  ),
                ),
                SizedBox(height: 20),
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
                  "Upcoming Appointments",
                  style: TextStyle(
                      color: colorGrayDarker,
                      fontWeight: FontWeight.w700,
                      fontSize: 26
                  ),
                ),
                SizedBox(height: 10),
                filteredAppointments.length > 0 ? Column(
                  children: List.generate(filteredAppointments.length, (index) {
                    DateTime thisDate = filteredAppointments[index].dateTime;
                    String dateString = thisDate.toLocal().toString();
                    return TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        width: 15,
                        color: colorPrimary,
                      ),
                      afterLineStyle: LineStyle(
                        color: colorSecondary
                      ),
                      beforeLineStyle: LineStyle(
                          color: colorSecondary
                      ),
                      hasIndicator: true,
                      isFirst: index == 0,
                      isLast: index == filteredAppointments.length - 1,
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
                                            Text(
                                              filteredAppointments[index].animalName.substring(0,1).toUpperCase() +
                                                  filteredAppointments[index].animalName.substring(1),
                                              style:
                                              TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  child: Text(
                                                    filteredAppointments[index].location.substring(0,1).toUpperCase() +
                                                        filteredAppointments[index].location.substring(1),
                                                    style: TextStyle(
                                                        fontSize: 15, color: Color(0xFF000000).withOpacity(0.7)),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
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
                          Config.dateToTimeString(filteredAppointments[index].dateTime),
                          style: TextStyle(
                            color: colorPrimary
                          ),
                        ),
                      ),
                    );
                  }),
                ) :
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x42ffff40),
                  ),
                  child: Center(
                    child: Text(
                      "You have no appointments today",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
