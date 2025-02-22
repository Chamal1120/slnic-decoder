class NicInfo {
  final String nicNo;
  final String format;
  final String serialNo;
  final String birthDate;
  final String weekDay;
  final String age;
  final String gender;
  final String votability;

  const NicInfo({
    required this.nicNo,
    required this.format,
    required this.serialNo,
    required this.birthDate,
    required this.weekDay,
    required this.age,
    required this.gender,
    required this.votability,
  });

  // Helper function: check if a year is a leap year

  static bool isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }

  // Decode 9 digit NIC
  factory NicInfo.from9Digit(String nicVal) {
    String gender = "Male";
    String votability = "No";
    String serialNo = nicVal.substring(5, 9);
    String nicLetter = nicVal.substring(9).toLowerCase();
    int birthYear = int.parse("19${nicVal.substring(0, 2)}");
    int birthCode = int.parse(nicVal.substring(2, 5));

    // Check gender
    if (birthCode > 500) {
      birthCode -= 500;
      gender = "Female";
    }

    // Days in months (Non-Leap & Leap Year)
    List<int> daysInMonths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    // Determine birth month and day
    int remainingDays = birthCode;
    int month = 1;

    while (remainingDays > daysInMonths[month - 1]) {
      remainingDays -= daysInMonths[month - 1];
      month++;
    }

    int day = remainingDays;

    // Handle 29th February for non-leap years
    if (month == 2 && day == 29 && !isLeapYear(birthYear)) {
      month = 3;
      day = 1;
    }

    // Format the birth date
    String birthDate =
        '$birthYear/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';

    // Parse the string into a DateTime object
    DateTime date = DateTime.parse(birthDate.replaceAll("/", "-"));

    // Get the day of the week from the DateTime object
    List<String> weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    String dayOfWeek = weekdays[date.weekday - 1];
    DateTime today = DateTime.now();

    // Calculate age
    int age = today.year - birthYear;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    String ageString = "${age.toString()} Years";

    // Check votability
    if (nicLetter == "v") {
      votability = "Yes";
    }

    return NicInfo(
      nicNo: nicVal,
      format: "Old",
      serialNo: serialNo,
      birthDate: birthDate,
      weekDay: dayOfWeek,
      age: ageString,
      gender: gender,
      votability: votability,
    );
  }

  // Decode 12 digit NIC
  factory NicInfo.from12Digit(String nicVal) {
    String gender = "Male";
    String votability = "No";
    String serialNo = nicVal.substring(7);
    int birthYear = int.parse(nicVal.substring(0, 4));
    int birthCode = int.parse(nicVal.substring(4, 7));

    // Check gender
    if (birthCode > 500) {
      birthCode -= 500;
      gender = "Female";
    }

    // Days in months (Non-Leap & Leap Year)
    List<int> daysInMonths = [
      31,
      29,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ];

    // Determine birth month and day
    int remainingDays = birthCode;
    int month = 1;

    while (remainingDays > daysInMonths[month - 1]) {
      remainingDays -= daysInMonths[month - 1];
      month++;
    }

    int day = remainingDays;

    // Handle 29th February for non-leap years
    if (month == 2 && day == 29 && !isLeapYear(birthYear)) {
      month = 3;
      day = 1;
    }

    // Format the birth date
    String birthDate =
        '$birthYear/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
    // Parse the string into a DateTime object
    DateTime date = DateTime.parse(birthDate.replaceAll("/", "-"));

    // Get the day of the week from the DateTime object
    List<String> weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    String dayOfWeek = weekdays[date.weekday - 1];

    DateTime today = DateTime.now();

    // Calculate age
    int age = today.year - birthYear;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    String ageString = "${age.toString()} Years";

    // Check votability (For 12-digit NICs, age determines votability)
    if (age >= 18) {
      votability = "Yes";
    }

    return NicInfo(
      nicNo: nicVal,
      format: "New",
      serialNo: serialNo,
      birthDate: birthDate,
      weekDay: dayOfWeek,
      age: ageString,
      gender: gender,
      votability: votability,
    );
  }
}
