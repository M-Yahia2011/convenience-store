import 'package:flutter/material.dart';

/// Subtitle on LHS & a Button on RHS
class SubtitleAndTextButtonRow extends StatelessWidget {
  final String subtitle;
  final String buttonText;
  final String route;
  const SubtitleAndTextButtonRow(
      {Key? key,
      required this.buttonText,
      required this.subtitle,
      required this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(route);
            },
            child: Text(buttonText))
      ],
    );
  }
}
