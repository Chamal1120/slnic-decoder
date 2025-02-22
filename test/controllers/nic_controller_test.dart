import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nic_decoder/controllers/nic_controller.dart';

void main() {
  late NicController nicController;

  setUp(() {
    nicController = NicController();
  });

  final testCases = [
    {
      'nic': '960545678V',
      'format': 'Old',
      'serialNo': '5678',
      'birthDate': '1996/02/23',
      'weekDay': 'Friday',
      'gender': 'Male',
      'votability': 'Yes',
    },
    {
      'nic': '198502312345',
      'format': 'New',
      'serialNo': '12345',
      'birthDate': '1985/01/23',
      'weekDay': 'Wednesday',
      'gender': 'Male',
      'votability': 'Yes',
    },
    {
      'nic': '960545678V',
      'format': 'Old',
      'serialNo': '5678',
      'birthDate': '1996/02/23',
      'weekDay': 'Friday',
      'gender': 'Male',
      'votability': 'Yes',
    },
    {
      'nic': '198502312345',
      'format': 'New',
      'serialNo': '12345',
      'birthDate': '1985/01/23',
      'weekDay': 'Wednesday',
      'gender': 'Male',
      'votability': 'Yes',
    },
    {
      'nic': '780145678X',
      'format': 'Old',
      'serialNo': '5678',
      'birthDate': '1978/01/14',
      'weekDay': 'Saturday',
      'gender': 'Male',
      'votability': 'No',
    },
    {
      'nic': '200802312678',
      'format': 'New',
      'serialNo': '12678',
      'birthDate': '2008/01/23',
      'weekDay': 'Wednesday',
      'gender': 'Male',
      'votability': 'No',
    },
    {
      'nic': '200806012678',
      'format': 'New',
      'serialNo': '12678',
      'birthDate': '2008/02/29',
      'weekDay': 'Friday',
      'gender': 'Male',
      'votability': 'No',
    },
    {
      'nic': '200906012678',
      'format': 'New',
      'serialNo': '12678',
      'birthDate': '2009/03/01',
      'weekDay': 'Sunday',
      'gender': 'Male',
      'votability': 'No',
    },
    {
      'nic': '195667344332',
      'format': 'New',
      'serialNo': '44332',
      'birthDate': '1956/06/21',
      'weekDay': 'Thursday',
      'gender': 'Female',
      'votability': 'Yes',
    },
    {
      'nic': '199830033542',
      'format': 'New',
      'serialNo': '33542',
      'birthDate': '1998/10/26',
      'weekDay': 'Monday',
      'gender': 'Male',
      'votability': 'Yes',
    },
    {
      'nic': '200215501320',
      'format': 'New',
      'serialNo': '01320',
      'birthDate': '2002/06/03',
      'weekDay': 'Monday',
      'gender': 'Male',
      'votability': 'Yes',
    },
    {
      'nic': '199212011234',
      'format': 'New',
      'serialNo': '11234',
      'birthDate': '1992/04/29',
      'weekDay': 'Wednesday',
      'gender': 'Male',
      'votability': 'Yes',
    },
  ];

  for (var testCase in testCases) {
    test('decodeNic should correctly decode ${testCase['nic']}', () {
      // Calculate the expected age based on the current date and birth date
      final currentDate = DateTime.now();

      // Safely check and parse the birthDate if it is not null
      final birthDateString = testCase['birthDate'];
      DateTime? birthDate;

      if (birthDateString != null) {
        birthDate = DateTime.parse(birthDateString.replaceAll('/', '-'));
      }

      if (birthDate == null) {
        return;
      }

      // Calculate expected age
      int expectedAge = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        expectedAge--;
      }

      // Decode the NIC
      nicController.decodeNic(testCase['nic'] as String);

      // Assert that the decoded NIC info matches the expected values
      expect(nicController.nicInfo.value, isNotNull);
      expect(nicController.nicInfo.value!.serialNo, testCase['serialNo']);
      expect(nicController.nicInfo.value!.birthDate, testCase['birthDate']);
      expect(nicController.nicInfo.value!.weekDay, testCase['weekDay']);
      expect(nicController.nicInfo.value!.age,
          '$expectedAge Years'); // Compare dynamically calculated age
      expect(nicController.nicInfo.value!.gender, testCase['gender']);
      expect(nicController.nicInfo.value!.votability, testCase['votability']);
      expect(nicController.nicInfo.value!.format, testCase['format']);
    });
  }

  test('decodeNic should not update nicInfo for an invalid NIC', () {
    nicController.decodeNic('invalid');

    expect(nicController.nicInfo.value, isNull);
  });
}

