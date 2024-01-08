import 'package:flutter/material.dart';

import '../../../common/ui_helpers.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Column(
        children: [
          verticalSpaceLarge,
          Text(
            "JSON to Dart",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          verticalSpaceMedium,
          Text(
            "Paste your JSON in the textarea below, click convert and get your Dart classes for free.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          verticalSpaceMassive,
        ],
      ),
    );
  }
}
