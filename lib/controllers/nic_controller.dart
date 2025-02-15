import 'package:flutter_nic_decoder/models/nic_info.dart';
import 'package:get/get.dart';

// Decode the NIC number and update the state variables
class NicController extends GetxController {
  var nicInfo = Rxn<NicInfo>();
  var isLoading = true.obs;

  void decodeNic(String nicVal) {
    String checkString = nicVal;
    isLoading.value = true;
    nicInfo.value = null;

    if (nicVal.length == 10) {
      checkString = nicVal.substring(0, nicVal.length - 1);
    }
    
    if (int.tryParse(checkString) == null) {
      isLoading.value = false;
      return;
    }

    // Check number length and conditionally create proper NicInfo objects
    if (nicVal.length == 10) {
      nicInfo.value = NicInfo.from9Digit(nicVal);
    } else if (nicVal.length == 12) {
      nicInfo.value = NicInfo.from12Digit(nicVal);
    } else {
      isLoading.value = false;
      return;
    }

    isLoading.value = false;
  }
}
