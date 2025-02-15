import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nic_decoder/controllers/nic_controller.dart';
import 'package:flutter_nic_decoder/models/nic_info.dart';

void main() {
  late NicController nicController;

  setUp(() {
    nicController = NicController();
  });

  test('decodeNic should update nicInfo for a 10-digit NIC', () {
    nicController.decodeNic('853400937v');

    expect(nicController.nicInfo.value, isNotNull);
    expect(nicController.nicInfo.value!.serialNo, '0937');
    expect(nicController.nicInfo.value!.birthDate, '1985/12/05');
    expect(nicController.nicInfo.value!.gender, 'Male');
    expect(nicController.nicInfo.value!.votability, 'Yes');
  });

  test('decodeNic should update nicInfo for a 12-digit NIC', () {
    nicController.decodeNic('199932511383');

    expect(nicController.nicInfo.value, isNotNull);
    expect(nicController.nicInfo.value!.serialNo, '11383');
    expect(nicController.nicInfo.value!.birthDate, '1999/11/20');
    expect(nicController.nicInfo.value!.gender, 'Male');
    expect(nicController.nicInfo.value!.votability, 'Yes');
  });

  test('decodeNic should not update nicInfo for an invalid NIC', () {
    nicController.decodeNic('invalid');

    expect(nicController.nicInfo.value, isNull);
  });
}

