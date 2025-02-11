import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NIC Decoder',
            style: TextStyle(
              color: flavor.yellow,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
