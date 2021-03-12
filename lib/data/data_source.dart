import 'package:vet_app/data/config.dart';
import 'package:vet_app/model/appointment_model.dart';
import 'package:vet_app/model/payments_model.dart';

final List conversationList = [
  {
    "name": "Novac",
    "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
    "isOnline": true,
    "hasStory": true,
    "message": "Where are you?",
    "time": "5:00 pm"
  },
  {
    "name": "Derick",
    "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
    "isOnline": false,
    "hasStory": false,
    "message": "It's good!!",
    "time": "7:00 am"
  },
  {
    "name": "Mevis",
    "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
    "isOnline": true,
    "hasStory": false,
    "message": "I love You too!",
    "time": "6:50 am"
  },
  {
    "name": "Emannual",
    "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
    "isOnline": true,
    "hasStory": true,
    "message": "Got to go!! Bye!!",
    "time": "yesterday"
  },
  {
    "name": "Gracy",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
    "isOnline": false,
    "hasStory": false,
    "message": "Sorry, I forgot!",
    "time": "2nd Feb"
  },
  {
    "name": "Robert",
    "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
    "isOnline": false,
    "hasStory": true,
    "message": "No, I won't go!",
    "time": "28th Jan"
  },
  {
    "name": "Lucy",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
    "isOnline": false,
    "hasStory": false,
    "message": "Hahahahahaha",
    "time": "25th Jan"
  },
  {
    "name": "Emma",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
    "isOnline": false,
    "hasStory": false,
    "message": "Been a while!",
    "time": "15th Jan"
  }
];

List<Appointment> generateAppointments(){
  List<Appointment> appointmentList = [];

  DateTime now = new DateTime.now();
  DateTime date = Config.stringToDate("2021-03-12");

  appointmentList.add(new Appointment(id: "1", dateTime: Config.stringToDate('2021-03-12 09:00:00'), animalName: "dog",
      ownerName: "Novac", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "completed", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "2", dateTime: Config.stringToDate('2021-03-12 11:00:00'), animalName: "cow",
      ownerName: "Derrick", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "pending", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "3", dateTime: Config.stringToDate('2021-03-12 12:20:00'), animalName: "cat",
      ownerName: "Mevis", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "completed", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "4", dateTime: Config.stringToDate('2021-03-12 14:30:00'), animalName: "pig",
      ownerName: "Emmanuel", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "cancelled", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "5", dateTime: Config.stringToDate('2021-03-13 11:00:00'), animalName: "dog",
      ownerName: "Gracy", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "pending", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "1", dateTime: Config.stringToDate('2021-03-13 13:50:00'), animalName: "dog",
      ownerName: "Jeremy", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "completed", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "2", dateTime: Config.stringToDate('2021-03-13 13:50:00'), animalName: "cow",
      ownerName: "Clark", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "pending", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "3", dateTime: Config.stringToDate('2021-03-13 15:00:00'), animalName: "cat",
      ownerName: "Zucker", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "pending", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "4", dateTime: Config.stringToDate('2021-03-14 13:50:00'), animalName: "pig",
      ownerName: "George", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "pending", appointmentType: "checkup", location: "clinic"
  ));

  appointmentList.add(new Appointment(id: "5", dateTime: Config.stringToDate('2021-03-15 13:50:00'), animalName: "dog",
      ownerName: "Mariam", phoneNumber: "0705352411", animalAge: "5", animalSex: "male",
      animalWeight: "28", appointmentStatus: "pending", appointmentType: "checkup", location: "clinic"
  ));

  return appointmentList;
}

List<Payment> generatePayments(){
  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day, now.hour, now.minute);

  List<Payment> paymentsList = [];

  paymentsList.add(Payment(paymentId: "1", appointmentId: "1", amountPaid: 800, date: date));
  paymentsList.add(Payment(paymentId: "2", appointmentId: "2", amountPaid: 1500, date: date));
  paymentsList.add(Payment(paymentId: "3", appointmentId: "3", amountPaid: 1200, date: date));
  paymentsList.add(Payment(paymentId: "4", appointmentId: "4", amountPaid: 5200, date: date));
  paymentsList.add(Payment(paymentId: "5", appointmentId: "5", amountPaid: 7600, date: date));
  paymentsList.add(Payment(paymentId: "6", appointmentId: "6", amountPaid: 2300, date: date));

  return paymentsList;
}