import 'package:flutter/material.dart';
import 'package:haupcar/core/core.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetWidget({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).noInternet,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).checkConnection,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(AppLocalizations.of(context).retry),
          )
        ],
      ),
    );
  }
}
