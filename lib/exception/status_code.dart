import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// library roi
class StatusCode {
  
  // Properties
  final bool success;
  final String code;
  final String message;

  // Constructor
  StatusCode(this.success, this.code, this.message);

  factory StatusCode.success({String? message}) {
    message ??= 'Berhasil.';
    return StatusCode(true, '200', message);
  }

  factory StatusCode.failure({String? code, String? message}) {
    message ??= 'Kegagalan tidak diketahui.';
    code ??= '500';
    return StatusCode(false, code, message);
  }

  factory StatusCode.failureFirebaseAuth(FirebaseAuthException error) {
    return StatusCode(false, error.code, error.message ?? error.code);
  }

  showDialogStatusCode(BuildContext context) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: success ? Colors.green : Colors.red,
            title: const Text('Pemberitahuan'),
            content: Text('$code : $message'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  showSnackBarStatusCode(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Text(message),
        duration: const Duration(milliseconds: 5000),
        width: 400, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
