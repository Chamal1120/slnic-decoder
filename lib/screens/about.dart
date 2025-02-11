import 'package:flutter/material.dart';
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
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Developed by',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'Chamal1120',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Made with',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'Flutter + Material You + Catppuccin',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 50.0,
          ),
          Linkify(
            onOpen: (link) async {
              if (!await launchUrl(Uri.parse(link.url))) {
                throw Exception('Could not launch ${link.url}');
              }
            },
            text: "Test url to https://example.com using Linkify.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
