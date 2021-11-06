import 'package:flutter/material.dart';

Future<bool> ExitAlert(BuildContext ctx) async {
  bool exit = false;
  return await showDialog(
      context: ctx,
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setState) {
          return AlertDialog(
            title: Text('Attention'),
            actions: [
              TextButton(
                  onPressed: () async {
                    setState(() => exit = true);

                    // await Provider.of<Auth>(ctx, listen: false).logout();
                    Navigator.of(ctx).pop(true);
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 15),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: Text(
                    'No',
                    style: TextStyle(fontSize: 15),
                  ))
            ],
            content: exit
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Text('Do you want to Exit?'),
          );
        });
      });
}
