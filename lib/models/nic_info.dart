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

    // Evaluate the actual birth date using Dart's DateTime class
    DateTime date =
        DateTime(birthYear, 1, 1).add(Duration(days: birthCode - 2));

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

    // Evaluate the actual birth date using Dart's DateTime class
    DateTime date =
        DateTime(birthYear, 1, 1).add(Duration(days: birthCode - 2));

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
