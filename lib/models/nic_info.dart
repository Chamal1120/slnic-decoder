class NicInfo {
  final String nicNo;
  final String format;
  final String serialNo;
  final String birthDate;
  final String age;
  final String gender;
  final String votability;

  const NicInfo({
    required this.nicNo,
    required this.format,
    required this.serialNo,
    required this.birthDate,
    required this.age,
    required this.gender,
    required this.votability,
  });

  // Helper function: check if a year is a leap year
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  // Decode 9 digit NIC
  factory NicInfo.from9Digit(String nicVal) {
    String gender = "Male";
    String votability = "No";
    String serialNo = nicVal.substring(5, 9);
    String nicLetter = nicVal.substring(9).toLowerCase();
    int birthYear = int.parse("19${nicVal.substring(0, 2)}");
    int birthCode = int.parse(nicVal.substring(2, 5));

    // Check if birthYear is a leap year and adjust birthCode accordingly
    int dayAdjustment = isLeapYear(birthYear) ? 1 : 2;
    DateTime date = DateTime(birthYear, 1, 1)
        .add(Duration(days: birthCode - dayAdjustment));

    DateTime today = DateTime.now();

    // Calculate age
    int age = today.year - date.year;

    // Adjust if the birthday hasn’t occurred yet this year
    if (today.month < date.month ||
        (today.month == date.month && today.day < date.day)) {
      age--;
    }

    String ageString = age.toString();

    // Format the date to represent as xxxx/xx/xx
    String birthDate =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

    // Check gender
    if (birthCode > 500) {
      birthCode = birthCode - 500;
      gender = "Female";
    }

    // Check votability
    if (nicLetter == "v") {
      votability = "Yes";
    }

    // Return NicInfo Object
    return NicInfo(
      nicNo: nicVal,
      format: "Old",
      serialNo: serialNo,
      birthDate: birthDate,
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

    // Check if birthYear is a leap year and adjust birthCode accordingly
    int dayAdjustment = isLeapYear(birthYear) ? 1 : 2;
    DateTime date = DateTime(birthYear, 1, 1)
        .add(Duration(days: birthCode - dayAdjustment));

    // Format the date to represent as xxxx/xx/xx
    String birthDate =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

    DateTime today = DateTime.now();

    // Calculate age
    int age = today.year - date.year;

    // Adjust if the birthday hasn’t occurred yet this year
    if (today.month < date.month ||
        (today.month == date.month && today.day < date.day)) {
      age--;
    }

    String ageString = age.toString();

    // Check gender
    if (birthCode > 500) {
      birthCode = birthCode - 500;
      gender = "Female";
    }

    // Check votability
    if (age > 18) {
      votability = "Yes";
    }

    // Return NicInfo Object
    return NicInfo(
      nicNo: nicVal,
      format: "New",
      serialNo: serialNo,
      birthDate: birthDate,
      age: ageString,
      gender: gender,
      votability: votability,
    );
  }
}
