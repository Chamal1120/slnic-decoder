// Get the info off of 9 digit NIC
String decode9Digit(String nicVal) {
  String gender = "Male";
  String voteability = "No";
  String serialNo = nicVal.substring(6,10);
  String nicLetter = nicVal.substring(9).toLowerCase();
  int birthYear = int.parse("00${nicVal.substring(0, 2)}");
  int birthCode = int.parse(nicVal.substring(2, 5));

  if (birthCode > 500) {
    birthCode = birthCode - 500;
    gender = "Female";
  }

  if (nicLetter == "v") {
    voteability = "Yes";
  }

  DateTime date = DateTime(birthYear, 1, 1).add(Duration(days: birthCode - 1));
  String formattedDate =
      '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

  // Return test
  return ("$serialNo $formattedDate $gender $voteability");
}


// Get the info off of 12 digit NIC
String decode12Digit(String nicVal) {
  String gender = "Male";
  String voteability = "No";
  String serialNo = nicVal.substring(8);
  int birthYear = int.parse(nicVal.substring(0, 5));
  int birthCode = int.parse(nicVal.substring(5, 8));

  if (birthCode > 500) {
    birthCode = birthCode - 500;
    gender = "Female";
  }

  if (birthYear > 18) {
    voteability = "Yes";
  }

  DateTime date = DateTime(birthYear, 1, 1).add(Duration(days: birthCode - 1));
  String formattedDate =
      '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';

  // Return test
  return ("$serialNo $formattedDate $gender $voteability");
}
