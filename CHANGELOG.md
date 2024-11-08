## 2.0.0
* (Breaking changes)
* Added more flexibility to the `BottomCupertinoTabbar` widget to define its own `BottomCupertinoTabItem` with custom widgets, instead of a single SVG string (thanks @nissaba). In this way, you can define your own icons with custom widgets.
* Updated `tabbarModel` callback on `BottomCupertinoTabbar` main widget to expose nested navigator, in this way you can access the specific navigator of each tab.
* Added `overrideIconsColor` flag to `BottomCupertinoTabbar` main widget to override the default icons color.
* `activeColor` and `inactiveColor` properties are now optional, used in combination with `overrideIconsColor` flag.
* Updated `BottomCupertinoTabItem`: now accepts new properties like single icon, active and inactive icons and active and inactive styles for labels.
* Added more examples in the example app and updated the documentation.

## 1.0.13

* Exposed some Scaffold properties to allow more customizations options. 

## 1.0.12

* Improve tabbar performance on keyboard show and hide events
* Bump version to 1.0.12

## 1.0.11

* Fixed missing kIsWeb check.

## 1.0.10

* Restored support for web.

## 1.0.9

* Fixed dart format linting.

## 1.0.8

* Updated dependencies and enhanced performances on inner elements.

## 1.0.7

* Exported `BottomCupertinoProviderModel` to let externals change tab more easily.

## 1.0.6

* Fixed nestedNavigator generation.

## 1.0.5

* Made const `BottomCupertinoTab` class.

## 1.0.4

* Updated images on `README.md`.

## 1.0.3

* Updated `README.md`.
 
## 1.0.2

* Updated `README.md` and commented out code a bit.

## 1.0.1

* Updated `README.md`.

## 1.0.0

* Initial release.
