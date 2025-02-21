import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'v0.1.4+3',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 30.0,
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
            height: 20.0,
          ),
         // Linkify(
         //   onOpen: (link) async {
         //     if (!await launchUrl(Uri.parse(link.url))) {
         //       throw Exception('Could not launch ${link.url}');
         //     }
         //   },
         //   text: "Test url to https://example.com using Linkify.",
         //   style: Theme.of(context).textTheme.bodySmall,
         // ),
          Text(
            'My online presence :)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => launchUrl(Uri.parse('https://github.com/Chamal1120')),
                child: SvgPicture.asset(
                  'assets/social/github.svg',
                  width: 22.0,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () => launchUrl(Uri.parse('https://discord.gg/vGVNhWXfEj')),
                child: SvgPicture.asset(
                  'assets/social/discord.svg',
                  width: 25.0,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () => launchUrl(Uri.parse('https://dev.to/chamal1120')),
                child: SvgPicture.asset(
                  'assets/social/devdotto.svg',
                  width: 28.0,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
