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
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        // color: Theme.of(context).accentColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        constraints: const BoxConstraints(
          minWidth: 16,
          minHeight: 16,
        ),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
