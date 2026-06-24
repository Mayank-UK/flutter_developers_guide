import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';

class ShowError extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const ShowError({
    required this.failure,
    this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _iconFor(failure),
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              failure.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _iconFor(Failure failure) => switch (failure) {
        NetworkFailure() => Icons.wifi_off,
        ServerFailure() => Icons.cloud_off,
        CacheFailure() => Icons.storage_outlined,
        UnknownFailure() => Icons.error_outline,
        AuthFailure() => Icons.storage_outlined,
        FirestoreFailure() => Icons.storage,
      };
}
