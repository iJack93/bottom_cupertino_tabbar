## Overview
The Flutter package `BottomCupertinoTabbar` is designed for creating a customizable and intuitive bottom navigation bar with a Cupertino (iOS-style) aesthetic. It offers separate navigation stacks for each tab, ensuring that the state of each tab is maintained when users switch between them.
The package provides extensive customization options, including the ability to add a floating action button or other widgets in various locations on the tab bar.

---

<p align="center">
  <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/recording.gif?raw=true"
    alt="An animated image of the BottomCupertinoTabbar in action" width="300"/>
</p>
<p align="center">
    <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/Screenshot_20231127_085844.png?raw=true" width="200" alt="homepage preview">
    <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/Screenshot_20231127_085943.png?raw=true" width="200" alt="homepage preview">
</p>

<p align="center">
  <a href="https://pub.dev/packages/bottom_cupertino_tabbar"><img src="https://img.shields.io/pub/v/bottom_cupertino_tabbar" alt="pub.dev"></a>
  <a href="https://github.com/hacktons/bottom_cupertino_tabbar"><img src="https://img.shields.io/badge/platform-flutter-ff69b4.svg" alt="github"></a>
</p>

---


## Table of contents

- [Features](#features)
- [Installation](#installation)
- [Import](#import)
- [Basic Usage](#basic-usage)
- [Customization](#customization)
- [Tabs and State preservation](#tabs-and-state-preservation)
- [Complete example](#complete-example)
- [Conclusion](#conclusion)
- [Donate](#donate)

## Features
* **Cupertino Aesthetic**: offers a bottom navigation bar with an iOS-style (Cupertino) design, fitting seamlessly into apps that aim for an iOS look and feel.
* **Separate Navigation Stacks**: supports independent navigation stacks for each tab, allowing the preservation of the navigation history and the state of each tab when switching between them.
* **Customizable Tab Items**: customize icons for each tab's active and inactive states, add text labels to tabs, display a notification badge with a counter on tabs and more.
* **Customization of the Tab Bar**: customize the colors of the tab icons and text for their active and inactive states, set the color of the notification badges, determine which tab should be active initially and more.
* **Floating Action Button (FAB) or Custom Widgets**: integrate a floating action button or other widgets into the tab bar, with the flexibility to position it in the center or any other `FloatingActionButtonLocation`.
* **Responsive and Adaptive**: designed to be responsive and adapt to different screen sizes and orientations.
* **Easy Integration**: can be easily integrated into existing Flutter projects, enhancing the navigation experience without requiring extensive changes to the app structure.
* **State Preservation Across Tabs**: ensures that the state within each tab (like user inputs, scroll positions, etc.) is maintained when users switch between tabs, providing a seamless user experience.
* **Customizable Behavior on Tab Presses**: the `onTabPressed` callback allows for custom behavior when a tab is selected, like popping to the first route of the stack, refreshing data, or other actions.

## Installation
Add `bottom_cupertino_tabbar` as a dependency in your `pubspec.yaml` file.
```yaml
dependencies:
  bottom_cupertino_tabbar: ^latest_version
```

## Import
Import the package where you intend to use it.
```dart
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';
```

## Basic usage
`BottomCupertinoTabbar` can be used within a `StatefulWidget` for effective implementation.
```dart
class SimpleTabBar extends StatefulWidget {
  const SimpleTabBar({super.key});

  @override
  State<SimpleTabBar> createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomCupertinoTabbar(
      // Add your configuration and customization here
    );
  }
}
```
The provided example showcases a `SimpleTabBar` class using `BottomCupertinoTabbar` with various tabs like Home, Notifications, Contacts, and Settings. 
Each tab is linked to a corresponding page and icon, with maintained state and navigation stack, as seen in the following images.

<p align="center">
    <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/Screenshot_20231127_085844.png?raw=true" width="200" alt="appBar preview">
    <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/Screenshot_20231127_085903.png?raw=true" width="200" alt="appBar preview">
</p>

## Customization
`BottomCupertinoTabbar` can be extensively customized:
* **Floating Action Button**: You can add a floating action button (FAB) or any other widget to the center of the tabbar or any `FloatingActionButtonLocation` of your choice on the tab bar. This allows for additional actions and a unique design.
* **Custom Icons and Labels**: Each tab can have custom icons and labels, allowing for a personalized look and feel. You can set icons for both the active and inactive states.
* **Custom Colors and Themes**: Customize the color scheme and theme to match your app's design. You can set colors for both the active and inactive states.
* **Adjustable Size and Positioning**: The size and positioning of the tab bar and its elements can be adjusted to suit your layout needs.

### `BottomCupertinoTabbar` Main customization options
| Properties                   | Description                                                                            |
|------------------------------|----------------------------------------------------------------------------------------|
| activeColor                  | Color for the active tab icon and text                                                 |
| inactiveColor                | Color for the inactive tab icons and text.                                             |
| notificationsBadgeColor      | Color for notification badges.                                                         |
| firstActiveIndex             | Index of the initially active tab.                                                     |
| resizeToAvoidBottomInset     | Resizes the bottom bar when the keyboard appears.                                      |
| showLabels                   | Shows labels below icons.                                                              |
| onTabPressed                 | Callback function for customizing tabs per index and accessing navigators.             |
| children                     | A list of BottomCupertinoTab widgets that represent each tab in the tab bar.           |
| floatingActionButton         | An optional floating action button (or another widget) to be displayed on the tab bar. |
| floatingActionButtonLocation | The location of the floating action button on the tab bar.                             |
| resizeToAvoidBottomInset     | Controls whether the bottom bar should resize when the on-screen keyboard appears.     |
| backgroundColor              | The background color of the tab bar. Defaults to Colors.white.                         |
| showLabels                   | Flag to control whether labels are shown on the tab items.                             |
| appBar                       | Optional AppBar to be displayed at the top of the BottomCupertinoTabbar element.       |
| overrideIconsColor           | Flag to control whether to override the color of the icons.                            |


## Tabs and State preservation

Tabs are created using `BottomCupertinoTab` widgets. Each tab has its own navigation stack and state management, preserving user interactions and navigational history.
This class is a key component of the `BottomCupertinoTabbar` package. It represents an individual tab in the bottom navigation bar.

### BottomCupertinoTab

```dart
class BottomCupertinoTab {
  final BottomCupertinoTabItem tab;
  final Widget page;

  const BottomCupertinoTab({
    required this.tab,
    required this.page
  });
}
```

**Parameters**:
* `tab` (BottomCupertinoTabItem): The configuration for the tab's appearance and behavior.
* `page` (Widget): The widget to display when the tab is active. This is typically a Flutter page or screen.

Each tab consists of a `BottomCupertinoTabItem` for its configuration and a Flutter Widget that represents the content to display when the tab is selected.

### BottomCupertinoTabItem
The `BottomCupertinoTabItem` class is used to configure the appearance and behavior of an individual tab in the `BottomCupertinoTabbar`.
```dart
class BottomCupertinoTabItem {

  /// The icon to display.
  final Widget? icon;

  /// The icon when the tab is active.
  final Widget? activeIcon;

  /// The icon when the tab is inactive.
  final Widget? inactiveIcon;

  /// The text label for the tab.
  final String? label;

  /// The number of notifications to be displayed on the tab.
  final int notificationsCounter;

  /// Controls whether to show the notifications counter.
  final bool showNotifications;

  /// Indicates if the tab is to be considered as an empty placeholder.
  final bool empty;

  /// The text style to use for the label when the tab is active.
  final TextStyle? activeLabelTextStyle;

  /// The text style to use for the label when the tab is inactive.
  final TextStyle? inactiveLabelTextStyle;

  const BottomCupertinoTabItem({
    this.icon,
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.notificationsCounter = 0,
    this.showNotifications = false,
    this.empty = false,
    this.activeLabelTextStyle,
    this.inactiveLabelTextStyle,
  });
}
```

Example of a `BottomCupertinoTab`
```dart
BottomCupertinoTab(
  tab: BottomCupertinoTabItem(
    icon: Icon(Icons.home, size: 22,),
    label: "Home",
  ),
  page: HomePage(),
)
```

## Complete Example
Here is the code for the following example:


<p align="center">
    <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/Screenshot_20231127_085844.png?raw=true" width="200" alt="appBar preview">
    <img src="https://github.com/iJack93/bottom_cupertino_tabbar/blob/main/example/assets/screenshots/Screenshot_20231127_085903.png?raw=true" width="200" alt="appBar preview">
</p>

```dart
import 'package:flutter/material.dart';
import 'package:bottom_cupertino_tabbar/bottom_cupertino_tabbar.dart';

import '../pages/pages.dart';
import 'example_manager/example_manager.dart';

class EasyTabbar extends StatefulWidget {
  const EasyTabbar({super.key});

  @override
  State<EasyTabbar> createState() => _EasyTabbarState();
}

class _EasyTabbarState extends State<EasyTabbar> {
  @override
  Widget build(BuildContext context) {
    return BottomCupertinoTabbar(
      activeColor: Colors.blue,
      inactiveColor: Colors.grey[300]!,
      notificationsBadgeColor: Colors.red,
      firstActiveIndex: 0,
      resizeToAvoidBottomInset: false,
      showLabels: true,
      overrideIconsColor: true,
      tabbarModel: (model, nestedNavigator) {
        ExampleManager().tabbarProviderModel = model;
        ExampleManager().nestedNavigator = nestedNavigator;
      },
      onTabPressed: (index, model, nestedNavigator) {
        if (index != model.currentTab) {
          model.changePage(index);
        } else {
          if (nestedNavigator[index]?.currentContext != null) {
            Navigator.of(nestedNavigator[index]!.currentContext!)
                .popUntil((route) => route.isFirst);
          }
        }
      },
      children: const [
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            icon: Icon(Icons.home, size: 22,),
            label: "Home",
          ),
          page: HomePage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            icon: Icon(Icons.notifications, size: 22,),
            label: "Notifications",
          ),
          page: NotificationsPage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            icon: Icon(Icons.contacts, size: 22,),
            notificationsCounter: 4,
            showNotifications: true,
            label: "Contacts",
          ),
          page: ContactsPage(),
        ),
        BottomCupertinoTab(
          tab: BottomCupertinoTabItem(
            icon: Icon(Icons.settings, size: 22,),
            label: "Settings",
          ),
          page: SettingsPage(),
        ),
      ],
    );
  }
}
```

More examples can be found in the `example` folder of the package.

## Conclusion
`BottomCupertinoTabbar` is an ideal choice for Flutter apps requiring a bottom navigation bar with advanced customization, including the addition of a floating action button or other widgets in various positions.
This package aligns with native iOS navigation patterns and enhances user experience through its state preservation and extensive customization features.

## Donate
Do you like the package ? Consider donating offering me a coffe or a beer :)

<a href="https://www.buymeacoffee.com/jacopocausin" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
