import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/main.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About',
            style: TextStyle(
              color: flavor.yellow,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Developed by',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          Text(
            'Chamal1120',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          Linkify(
            onOpen: (link) async {
              if (!await launchUrl(Uri.parse(link.url))) {
                throw Exception('Could not launch ${link.url}');
              }
            },
            text: "Test url to https://example.com using Linkify.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            linkStyle: TextStyle(color: flavor.text),
          ),
        ],
      ),
    );
  }
}
