import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabItem extends StatelessWidget {
  final String activeIcon;
  final String inactiveIcon;
  final String? label;
  final bool active;
  final int notificationsCounter;
  final bool isFirstActiveIndex;
  final Color activeColor;
  final Color inactiveColor;
  final Color notificationsBadgeColor;
  final bool showNotifications;
  final bool showLabels;

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

  Widget _getItem() {
    Widget result = Container();
    if(showLabels && label != null) {
      result = Positioned(
        top: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 22,
              width: 22,
              child: SvgPicture.asset(
                active ? activeIcon : inactiveIcon,
                height: 22,
                colorFilter: ColorFilter.mode(
                    active ? activeColor : inactiveColor,
                    BlendMode.srcIn
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                label!,
                style: TextStyle(
                  color: active ? activeColor : inactiveColor,
                  fontSize: 11
                ),
              )
            )
          ],
        ),
      );
    } else {
      result = Positioned(
        top: 16,
        child: SizedBox(
          height: 22,
          width: 22,
          child: SvgPicture.asset(
            active ? activeIcon : inactiveIcon,
            height: 22,
            colorFilter: ColorFilter.mode(
                active ? activeColor : inactiveColor,
                BlendMode.srcIn
            ),
          ),
        ),
      );
    }
    return result;
  }

  Widget _getNotificationsBadge() {
    Widget result = Container();
    if(showNotifications && notificationsCounter > 0) {
      if(showLabels && label != null) {
        result = Positioned(
          top: 4,
          right: _getRightBadgeNotificationPosition(notificationsCounter),
          child: Container(
            width: _getNotificationBadgeWidth(notificationsCounter),
            height: 18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: active || notificationsCounter > 0
                  ? notificationsBadgeColor
                  : inactiveColor,
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
      } else {
        result = Positioned(
          top: 8,
          right: 18,
          child: Container(
            width: _getNotificationBadgeWidth(notificationsCounter),
            height: 18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: active || notificationsCounter > 0
                  ? notificationsBadgeColor
                  : inactiveColor,
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
    }
    return result;
  }

  double? _getRightBadgeNotificationPosition(int number) {
    double? result = 18;
    if(number.toString().length > 2) {
      result = 14;
    } else {
      result = 18;
    }
    return result;
  }

  double? _getNotificationBadgeWidth(int number) {
    double? result = 0;
    if(number.toString().length > 3) {
      result = 34;
    } else if(number.toString().length > 2) {
      result = 28;
    } else {
      result = 18;
    }
    return result;
  }

  String _getNotificationBadgeText(int number) {
    String result = "0";
    if(number.toString().length == 3) {
      result = "$number";
    } else if(number.toString().length > 3) {
      result = "999+";
    } else {
      result = number.toString();
    }
    return result;
  }

}
