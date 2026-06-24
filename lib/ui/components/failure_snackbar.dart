import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';

class FailureSnackbar {
  static void show(
    BuildContext context,
    Failure failure,
  ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(
                _iconFor(failure),
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  failure.message,
                ),
              ),
            ],
          ),
        ),
      );
  }

  static IconData _iconFor(Failure failure) => switch (failure) {
        NetworkFailure() => Icons.wifi_off,
        ServerFailure() => Icons.cloud_off,
        CacheFailure() => Icons.storage_outlined,
        UnknownFailure() => Icons.error_outline,
        AuthFailure() => Icons.storage_outlined,
        FirestoreFailure() => Icons.storage,
      };
}
