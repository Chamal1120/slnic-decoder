/// This class represents the information extracted from a NIC number.
class NicInfo {
  /// The original NIC number provided.
  final String nicNo;

  /// The format of the NIC (`"Old"` for 9-digit NIC, `"New"` for 12-digit NIC).
  final String format;

  /// The serial number extracted from the NIC.
  final String serialNo;

  /// The extracted birth date in `YYYY/MM/DD` format.
  final String birthDate;

  /// The weekday of the birth date.
  final String weekDay;

  /// The calculated age of the NIC holder.
  final String age;

  /// The gender of the NIC holder (`"Male"` or `"Female"`).
  final String gender;

  /// Indicates whether the NIC holder is eligible to vote (`"Yes"` or `"No"`).
  final String votability;

  /// Constructs a `NicInfo` object with required fields.
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

  /// Days in each month for both leap and non-leap years.
  static const List<int> daysInMonths = [
    31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
  ];

  /// List of weekdays corresponding to DateTime's weekday index.
  static const List<String> weekdays = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

  /// Determines whether a given year is a leap year.
  ///
  /// A year is a leap year if:
  /// - It is divisible by 4, and
  /// - Either not divisible by 100 or divisible by 400.
  static bool isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }

  /// Creates a `NicInfo` object from a **9-digit** Sri Lankan NIC number.
  ///
  /// - **Example**: `"901234567V"`
  ///
  /// - Extracts birth year, birth date, and gender.
  /// - Determines the serial number and votability.
  /// - Calculates age and weekday of birth.
  ///
  /// Returns a `NicInfo` object containing the extracted information.
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

    // Determine birth month and day
    int remainingDays = birthCode;
    int month = 1;

    while (remainingDays > daysInMonths[month - 1]) {
      remainingDays -= daysInMonths[month - 1];
      month++;
    }

    int day = remainingDays;

    // Handle 29th feb in non-leap years
    if (month == 2 && day == 29 && !isLeapYear(birthYear)) {
      month = 3;
      day = 1;
    }

    String birthDate =
        '$birthYear/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';

    // Determine weekday of birth
    DateTime date = DateTime.parse(birthDate.replaceAll("/", "-"));
    String dayOfWeek = weekdays[date.weekday - 1];

    // Calculate age
    DateTime today = DateTime.now();
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

  /// Creates a `NicInfo` object from a **12-digit** Sri Lankan NIC number.
  ///
  /// - **Example**: `"199012300123"`
  ///
  /// - Extracts birth year, birth date, and gender.
  /// - Determines the serial number and votability.
  /// - Calculates age and weekday of birth.
  ///
  /// Returns a `NicInfo` object containing the extracted information.
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

    // Determine birth month and day
    int remainingDays = birthCode;
    int month = 1;

    while (remainingDays > daysInMonths[month - 1]) {
      remainingDays -= daysInMonths[month - 1];
      month++;
    }

    int day = remainingDays;

    // Handle 29th feb in non-leap years
    if (month == 2 && day == 29 && !isLeapYear(birthYear)) {
      month = 3;
      day = 1;
    }

    String birthDate =
        '$birthYear/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';

    // Determine weekday of birth
    DateTime date = DateTime.parse(birthDate.replaceAll("/", "-"));
    String dayOfWeek = weekdays[date.weekday - 1];

    // Calculate age
    DateTime today = DateTime.now();
    int age = today.year - birthYear;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }
    String ageString = "${age.toString()} Years";

    // Determine votability (age-based for 12-digit NICs)
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

