import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconComponent extends StatelessWidget {

  final bool active;
  final String activeIcon;
  final String inactiveIcon;
  final Color activeColor;
  final Color inactiveColor;

  const IconComponent({
    super.key,
    required this.active,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
