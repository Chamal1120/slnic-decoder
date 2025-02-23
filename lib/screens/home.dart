import 'package:flutter/material.dart';
import 'package:slnic_decoder/controllers/nic_controller.dart';
import 'package:get/get.dart';
import 'package:slnic_decoder/screens/result.dart';

/// Allows the user to input an NIC number and decode it.
///
/// Screen contains:
/// - A `TextField` for entering the NIC number.
/// - A button that triggers the decoding of the NIC number when pressed.
/// - Displays an error message if the NIC number is invalid.
class HomePage extends StatelessWidget {
  HomePage({super.key});

  /// Controller for the TextField that holds the NIC number input.
  final TextEditingController textNicController = TextEditingController();

  /// A controller to handle the NIC decoding logic.
  final NicController nicController = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SLNIC Decoder',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 100.0),
          TextField(
            // Define the controller for the TextField
            controller: textNicController,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.clear_rounded),
                iconSize: 18.0,
                onPressed: () {
                  textNicController.clear();
                },
              ),
              hintText: 'Enter your NIC Number here',
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Get the NIC number from the TextField
              String nicVal = textNicController.text.trim();
              // Create a temp variable to store the NIC number
              String checkString = nicVal;

              // Check if the NIC number is of the correct length
              if (nicVal.length != 10 && nicVal.length != 12) {
                _showSnackBar(context, "NIC number entered is wrong length!");
                return;
              }

              // Check if the NIC number is in the correct format
              if (nicVal.length == 10) {
                checkString = nicVal.substring(0, nicVal.length - 1);
              } else if (nicVal.isEmpty) {
                _showSnackBar(context, "Please Enter a NIC number!");
                return;
              } else if (int.tryParse(checkString) == null) {
                _showSnackBar(context, "Please Enter a valid NIC number!");
                return;
              }

              // Decode the NIC number using the nicController
              nicController.decodeNic(nicVal);
              Get.to(() => ResultPage());
            },
            child: Text(
              'Decode',
            ),
          ),
        ],
      ),
    );
  }

  /// Displays a `SnackBar` with a message on the screen.
  ///
  /// This is a helper function that simplifies showing a `SnackBar` with the
  /// given message.
  ///
  /// **Parameters:**
  /// - `context`: The `BuildContext` required to show the `SnackBar`.
  /// - `message`: The message to display in the `SnackBar`.
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
      ),
    );
  }
}

