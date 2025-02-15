import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/controllers/nic_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_nic_decoder/screens/result.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textNicController = TextEditingController();
  final NicController nicController = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NIC Decoder',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 120.0),
          TextField(
            controller: textNicController,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.clear_rounded),
              hintText: 'Enter your NIC Number here',
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              String nicVal = textNicController.text.trim();
              String checkString = nicVal;


              if (nicVal.length != 10 && nicVal.length != 12) {
                Get.snackbar("Error", "NIC number entered is wrong length!");
                return;
              }

              if (nicVal.length == 10) {
                checkString = nicVal.substring(0, nicVal.length - 1);
              } else if (nicVal.isEmpty) {
                Get.snackbar("Error", "Please Enter a NIC number!");
                return;
              } else if (int.tryParse(checkString) == null) {
                Get.snackbar("Error", "Please Enter a valid NIC number!");
                return;
              }

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
}
