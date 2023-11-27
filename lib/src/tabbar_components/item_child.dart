import 'package:flutter/material.dart';

/// ItemChild is a StatelessWidget that wraps a given child widget with a Navigator.
/// It's typically used to embed a navigation stack in a component of a tabbed layout.
class ItemChild extends StatelessWidget {
  /// The widget that is to be displayed as the primary content of this item.
  final Widget child;

  /// An optional key for the Navigator. This is used when multiple navigators
  /// are required, such as in a tabbed interface, to maintain the state of each
  /// navigator separately.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Constructs an ItemChild widget.
  ///
  /// [child] is the widget to be displayed and is required.
  /// [navigatorKey] is a key for the Navigator, allowing for
  /// state management in complex navigation scenarios.
  const ItemChild({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    // ClipRect is used to clip any overflows that might occur.
    return ClipRect(
      // Navigator is used to manage a stack of pages or screens.
      child: Navigator(
        // Key for the Navigator, useful for keeping track of navigation state.
        key: navigatorKey,
        // onGenerateRoute handles the route generation logic.
        onGenerateRoute: (RouteSettings settings) {
          // MaterialPageRoute is used to build a page that materializes with
          // platform-specific transition animations.
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              // The primary content of this route is the 'child' widget.
              return child;
            },
          );
        },
      ),
    );
  }
}
