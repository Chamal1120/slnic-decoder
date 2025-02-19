class NicInfo {
  final String serialNo;
  final String birthDate;
  final String gender;
  final String votability;

  const NicInfo(
      {required this.serialNo,
      required this.birthDate,
      required this.gender,
      required this.votability});

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

    // Check gender
    if (birthCode > 500) {
      birthCode = birthCode - 500;
      gender = "Female";
    }

    // Check votability
    if (nicLetter == "v") {
      votability = "Yes";
    }

    // Check if birthYear is a leap year and adjust birthCode accordingly
    int dayAdjustment = isLeapYear(birthYear) ? 1 : 2;
    DateTime date = DateTime(birthYear, 1, 1)
        .add(Duration(days: birthCode - dayAdjustment));

    // Format the date to represent as xxxx/xx/xx
    String birthDate =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

    // Return NicInfo Object
    return NicInfo(
        serialNo: serialNo,
        birthDate: birthDate,
        gender: gender,
        votability: votability);
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
      birthCode = birthCode - 500;
      gender = "Female";
    }

    // Check votability
    if (birthYear > 18) {
      votability = "Yes";
    }

    // Check if birthYear is a leap year and adjust birthCode accordingly
    int dayAdjustment = isLeapYear(birthYear) ? 1 : 2;
    DateTime date = DateTime(birthYear, 1, 1)
        .add(Duration(days: birthCode - dayAdjustment));

    // Format the date to represent as xxxx/xx/xx
    String birthDate =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

    // Return NicInfo Object
    return NicInfo(
        serialNo: serialNo,
        birthDate: birthDate,
        gender: gender,
        votability: votability);
  }
}
