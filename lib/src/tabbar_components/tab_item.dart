import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// TabItem is a StatelessWidget used for rendering a single tab in a tab bar.
/// It supports active/inactive states, labels, notification badges, and custom coloring.
class TabItem extends StatelessWidget {
  /// The asset path of the icon when the tab is active.
  final String activeIcon;

  /// The asset path of the icon when the tab is inactive.
  final String inactiveIcon;

  /// The label text of the tab. It's optional and only displayed if [showLabels] is true.
  final String? label;

  /// Indicates whether the tab is currently active.
  final bool active;

  /// The counter for notifications. It is displayed in a badge if greater than 0.
  final int notificationsCounter;

  /// Indicates if this is the first tab to be active by default.
  final bool isFirstActiveIndex;

  /// The color to use for the active state of the tab (icon and text).
  final Color activeColor;

  /// The color to use for the inactive state of the tab (icon and text).
  final Color inactiveColor;

  /// The color of the notifications badge.
  final Color notificationsBadgeColor;

  /// A flag to control whether to show notifications badge.
  final bool showNotifications;

  /// A flag to control whether to show the label under the icon.
  final bool showLabels;

  /// Constructor for TabItem.
  const TabItem({
    super.key,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    this.active = false,
    this.notificationsCounter = 0,
    this.isFirstActiveIndex = false,
    required this.activeColor,
    required this.inactiveColor,
    required this.notificationsBadgeColor,
    this.showNotifications = false,
    this.showLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        _getItem(),
        _getNotificationsBadge(),
      ],
    );
  }

  /// Builds the main icon of the tab, including its label if [showLabels] is true.
  Widget _getItem() {
    // The container will hold either just the icon or icon with label.
    Widget result = Container();
    // Check if labels should be shown and the label is not null.
    if (showLabels && label != null) {
      // When showing labels, the icon and label are arranged in a column.
      result = Positioned(
        top: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // The icon itself, using an SVG image.
            SizedBox(
              height: 22,
              width: 22,
              child: SvgPicture.asset(
                active ? activeIcon : inactiveIcon,
                height: 22,
                colorFilter: ColorFilter.mode(
                  active ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            // The label text positioned below the icon.
            Container(
              margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                label!,
                style: TextStyle(
                    color: active ? activeColor : inactiveColor, fontSize: 11),
              ),
            ),
          ],
        ),
      );
    } else {
      // When not showing labels, only display the icon.
      result = Positioned(
        top: 16,
        child: SizedBox(
          height: 22,
          width: 22,
          child: SvgPicture.asset(
            active ? activeIcon : inactiveIcon,
            height: 22,
            colorFilter: ColorFilter.mode(
                active ? activeColor : inactiveColor, BlendMode.srcIn),
          ),
        ),
      );
    }
    return result;
  }

  /// Builds the notifications badge, positioned based on whether labels are shown.
  Widget _getNotificationsBadge() {
    Widget result = Container();
    // Only show the badge if notifications are to be shown and the count is positive.
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
          child: Center(
            child: Text(
              _getNotificationBadgeText(notificationsCounter),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
          ),
        ),
      );
    }
    return result;
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
