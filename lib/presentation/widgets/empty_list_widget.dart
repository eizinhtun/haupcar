import 'package:flutter/material.dart';
import 'package:haupcar/core/localization/app_localizations.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onReload;

  const EmptyListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/empty_box.json',
              width: 250,
              height: 250,
              repeat: true,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            if (onReload != null)
              ElevatedButton.icon(
                onPressed: onReload,
                icon: Icon(Icons.refresh),
                label: Text(
                  AppLocalizations.of(context).reload,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
