// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//  The simplest use case that illustrates how to make use of the
//  flutter_markdown package is to include a Markdown widget in a widget tree
//  and supply it with a character string of text containing Markdown formatting
//  syntax. Here is a simple Flutter app that creates a Markdown widget that
//  formats and displays the text in the string _markdownData. The resulting
//  Flutter app demonstrates the use of headers, rules, and emphasis text from
//  plain text Markdown syntax.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:url_launcher/url_launcher.dart';

const String _markdownData = """
The Official C APPS TEAM UI projects

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
 """;

Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
}

void main() {
  runApp(
    MaterialApp(
      title: "Markdown Demo",
      home: MD(),
    ),
  );
}

class MD extends StatelessWidget {
  const MD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Markdown Demo'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Markdown(
                data: _markdownData,
              ),
            ),
            ProgressiveImage(
              placeholder: NetworkImage('https://i.imgur.com/7XL923M.jpg'),
              // size: 1.87KB
              thumbnail: NetworkImage('https://i.imgur.com/7XL923M.jpg'),
              // size: 1.29MB
              image: NetworkImage('https://i.imgur.com/xVS07vQ.jpg'),
              height: 300,
              width: 500,
            ),
            ListTile(
              title: Text('Code of conduct'),
              subtitle: Text('Read our rules'),
              trailing: Icon(Icons.arrow_right_alt_rounded),
              contentPadding: EdgeInsets.only(left: 16.0, right: 24.0),
              onTap: () async {
                // final text = await getFileData('capps/capps_privacy_policy.md');
                // final text = await getFileData('capps/capps_terms.md');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(),
                      //   body: Container(
                      //     // color: Colors.orange.shade100,
                      //     child: Markdown(
                      //       data: text,
                      //       selectable: true,

                      //       physics: const BouncingScrollPhysics(),
                      //     ),
                      //   ),
                      // ),
                      body: FutureBuilder(
                          future: rootBundle.loadString("capps/capps_terms.md"),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.data != null && snapshot.hasData) {
                              final String text = snapshot.data ?? '';
                              return Markdown(
                                data: text,
                                onTapLink: (text, _url, title) async {
                                  print('Text: $text');
                                  print('Href: $_url');
                                  print('Title: $title');
                                  if (_url != null)
                                    await canLaunch(_url)
                                        ? await launch(
                                            _url,
                                            // webOnlyWindowName: title,
                                          )
                                        : throw 'Could not launch $_url';
                                },
                              );
                            }

                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                    settings: RouteSettings(name: 'organizers'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//  The flutter_markdown package has options for customizing and extending the
//  parsing of Markdown syntax and building of the formatted output. The demos
//  in this example app illustrate some of the potentials of the
//  flutter_markdown package.
