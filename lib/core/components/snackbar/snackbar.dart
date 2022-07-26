import 'package:flutter/material.dart';

class CustomSnackbar{
  static SnackBar snackBar = SnackBar(
          content: const Text("Please Try Again"),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
}