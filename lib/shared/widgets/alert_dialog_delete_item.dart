import 'package:flutter/material.dart';

class AlertDialogDeleteItem extends StatelessWidget {
  const AlertDialogDeleteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                title: Text(
                  'Delete Confirmation',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                content: Text('Are you sure you want to delete this item?',
                    style: Theme.of(context).textTheme.bodyLarge),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('Delete',
                          style: Theme.of(context).textTheme.bodyMedium)),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancel',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              );
  }
  
}