import 'package:slnic_decoder/models/nic_info.dart';
import 'package:get/get.dart';

/// The controller for handling NIC decoding logic using GetX.
///
/// This controller is responsible for:
/// - Validating the NIC number.
/// - Decoding the NIC based on its format (9-digit or 12-digit).
/// - Updating the state variables accordingly.
class NicController extends GetxController {
  /// Holds the decoded NIC information. It is `null` if no valid NIC is provided.
  var nicInfo = Rxn<NicInfo>();

  /// Indicates whether the NIC decoding process is in progress.
  var isLoading = true.obs;

  /// Decodes the given NIC number and updates the `nicInfo` state.
  ///
  /// This method:
  /// - Validates the NIC format.
  /// - Determines whether it is a 9-digit or 12-digit NIC.
  /// - Parses and creates a `NicInfo` object accordingly.
  /// - Updates `isLoading` to indicate the processing state.
  ///
  /// **Parameters:**
  /// - `nicVal`: A string representing the NIC number.
  ///
  /// **Behavior:**
  /// - If the NIC is 9 digits, the last character is ignored for numeric validation.
  /// - If the NIC is invalid (not numeric), the process stops early.
  /// - Updates `nicInfo` if the NIC is successfully decoded.
  /// - Sets `isLoading` to `false` when done.
  void decodeNic(String nicVal) {
    String checkString = nicVal;
    isLoading.value = true;
    nicInfo.value = null;

    if (nicVal.length == 10) {
      checkString = nicVal.substring(0, nicVal.length - 1);
    }

    // Validate NIC format (must be numeric after removing last character if needed)
    if (int.tryParse(checkString) == null) {
      isLoading.value = false;
      return;
    }

    // Decode NIC based on its length
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

