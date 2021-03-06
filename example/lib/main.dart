import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new LinkifyExample());

class LinkifyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter_linkify example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter_linkify example'),
        ),
        body: Center(
          child: Linkify(
            onLinkOpen: (url) {
              _launchLink(url);
            },
            onEmailOpen: (emailAddress) {
              final emailAddressLink = "mailto:$emailAddress";
              _launchLink(emailAddressLink);
            },
            text: "Made by https://cretezy.com\n\nMail: example@gmail.com",
          ),
        ),
      ),
    );
  }

  Future _launchLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
