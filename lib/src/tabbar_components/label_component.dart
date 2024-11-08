import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  /// The text label of the component.
  final String label;

  /// Indicates whether the component is currently active.
  final bool active;

  /// The color to use for the label when the component is active.
  final Color? activeColor;

  /// The color to use for the label when the component is inactive.
  final Color? inactiveColor;

  /// The text style to use for the label when the component is active.
  final TextStyle? activeLabelTextStyle;

  /// The text style to use for the label when the component is inactive.
  final TextStyle? inactiveLabelTextStyle;

  /// Creates a [LabelComponent] widget.
  ///
  /// Assertions ensure that either both [activeLabelTextStyle] and [inactiveLabelTextStyle] are provided,
  /// or both [activeColor] and [inactiveColor] are provided, but not both.
  const LabelComponent({
    super.key,
    required this.label,
    required this.active,
    required this.activeColor,
    required this.inactiveColor,
    this.activeLabelTextStyle,
    this.inactiveLabelTextStyle,
  })  : assert(
          (activeLabelTextStyle != null && inactiveLabelTextStyle != null) ||
              (activeColor != null && inactiveColor != null),
          'Either provide activeLabelTextStyle and inactiveLabelTextStyle, or activeColor and inactiveColor.',
        ),
        assert(
          (activeLabelTextStyle == null && inactiveLabelTextStyle == null) ||
              (activeColor == null && inactiveColor == null),
          'Cannot provide both label text styles and label colors. Choose one.',
        );

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle;
    if (activeLabelTextStyle != null && inactiveLabelTextStyle != null) {
      textStyle = active ? activeLabelTextStyle! : inactiveLabelTextStyle!;
    } else if (activeColor != null && inactiveColor != null) {
      textStyle = TextStyle(
        color: active ? activeColor : inactiveColor,
        fontSize: 11,
      );
    } else {
      textStyle = const TextStyle(fontSize: 11);
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
