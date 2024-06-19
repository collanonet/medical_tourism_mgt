

class Tour {
  List<Patient> patientNames;
  String tourName;
  String numberOfPeople;
  String groupType;
  List<Day> days;

  Tour({
    required this.patientNames,
    required this.tourName,
    required this.numberOfPeople,
    required this.groupType,
    required this.days,
  });

  
}

class Patient {
  String patientName;

  Patient({required this.patientName});
}

class Task {
  String placeName;
  String timeFrom;
  String timeTo;
  String traffic;
  String itinerary;

  Task({
    required this.placeName,
    required this.timeFrom,
    required this.timeTo,
    required this.traffic,
    required this.itinerary,
  });

}

class Group {
  List<Task> tasks;

  Group({required this.tasks});

}

class Day {
  String date;
  String meal;
  String placeName;
  String accommodation;
  Group group;

  Day({
    required this.date,
    required this.meal,
    required this.placeName,
    required this.accommodation,
    required this.group,
  });

  
}

