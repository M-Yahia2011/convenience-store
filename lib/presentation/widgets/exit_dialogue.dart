import 'package:flutter/material.dart';

Future<bool> exitAlert(BuildContext ctx) async {
  bool exit = false;
  return await showDialog(
      context: ctx,
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setState) {
          return AlertDialog(
            title: const Text('Attention'),
            actions: [
              TextButton(
                  onPressed: () async {
                    setState(() => exit = true);

                    // await Provider.of<Auth>(ctx, listen: false).logout();
                    Navigator.of(ctx).pop(true);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 15),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 15),
                  ))
            ],
            content: exit
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : const Text('Do you want to Exit?'),
          );
        });
      });
}
