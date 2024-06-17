import 'package:flutter/material.dart';

class NotificationsBadgeText extends StatelessWidget {
  final int notificationsCounter;

  const NotificationsBadgeText({
    super.key,
    required this.notificationsCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _getNotificationBadgeText(notificationsCounter),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }

  /// Formats the text to display in the notification badge.
  String _getNotificationBadgeText(int number) {
    // Display '999+' for counts higher than 999, else display the actual count.
    if (number > 999) {
      return "999+";
    } else {
      return number.toString();
    }
  }
}
