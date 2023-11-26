import 'package:flutter/material.dart';

class ItemChild extends StatelessWidget {

  final Widget child;
  final GlobalKey<NavigatorState>? navigatorKey;

  const ItemChild({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return child;
            },
          );
        },
      ),
    );
  }
}
