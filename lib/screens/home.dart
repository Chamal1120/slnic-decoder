import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_nic_decoder/screens/result.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NIC Decoder',
            style: Theme.of(context).textTheme.bodyLarge,
            ),
          const SizedBox(height: 120.0),
          TextField(
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.clear_rounded),
              hintText: 'Enter your NIC Number here',
              ),
            ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const ResultPage());
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
