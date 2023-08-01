import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({
    Key? key,
    required this.value,
    required this.color,
  }) : super(key: key);

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      // color: Theme.of(context).accentColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      constraints: const BoxConstraints(
        minWidth: 16,
        minHeight: 16,
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
