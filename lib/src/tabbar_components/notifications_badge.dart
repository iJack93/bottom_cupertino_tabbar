import 'package:flutter/material.dart';

import 'notifications_badge_text.dart';

class NotificationsBadge extends StatelessWidget {
  final bool showNotifications;
  final int notificationsCounter;
  final bool showLabels;
  final String? label;
  final Color notificationsBadgeColor;

  const NotificationsBadge({
    super.key,
    required this.showNotifications,
    required this.notificationsCounter,
    required this.showLabels,
    this.label,
    required this.notificationsBadgeColor,
  });

  @override
  Widget build(BuildContext context) {
    if (showNotifications && notificationsCounter > 0) {
      // Adjust the badge position and size based on whether labels are shown.
      return Positioned(
        top: showLabels && label != null ? 4 : 8,
        right: _getRightBadgeNotificationPosition(notificationsCounter),
        child: Container(
            width: _getNotificationBadgeWidth(notificationsCounter),
            height: 18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: notificationsBadgeColor,
            ),
            child: NotificationsBadgeText(
              notificationsCounter: notificationsCounter,
            )),
      );
    } else {
      return Container();
    }
  }

  /// Determines the right margin for the notification badge, adjusting its position.
  double? _getRightBadgeNotificationPosition(int number) {
    // Adjust the position based on the length of the notification count.
    return number.toString().length > 2 ? 14 : 22;
  }

  /// Calculates the width of the notification badge based on the number of notifications.
  double? _getNotificationBadgeWidth(int number) {
    // Adjust the badge width to accommodate different notification counts.
    double? result = 0;
    if (number.toString().length > 3) {
      result = 34;
    } else if (number.toString().length > 2) {
      result = 28;
    } else {
      result = 18;
    }
    return result;
  }
}
