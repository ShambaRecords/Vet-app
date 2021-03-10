class Appointment {
  String id, ownerName, phoneNumber, animalName,
      breed, animalSex, animalWeight, animalAge, appointmentType,
      location, appointmentStatus;

  DateTime dateTime;

  bool updatePin;


  // Constructor
  Appointment({
    this.id,
    this.dateTime,
    this.ownerName,
    this.phoneNumber,
    this.animalName,
    this.breed,
    this.animalSex,
    this.animalWeight,
    this.animalAge,
    this.appointmentType,
    this.location,
    this.appointmentStatus
  });
}