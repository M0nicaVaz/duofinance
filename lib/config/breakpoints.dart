import 'package:flutter/material.dart';

/// **Contains screen breakpoints.**
/// Example:
/// ```dart
/// Breakpoints(context).isMobile ? doSomething() : doSomethingElse();
/// ```
class Breakpoints {
  final BuildContext context;
  double _screenWidth = 0.0;

  /// ```dart
  /// ScreenWidth 1920.0
  /// ```
  static const double fullHd = 1920.0;

  /// ```dart
  /// ScreenWidth 1280.0
  /// ```
  static const double tablet = 1280.0;

  /// ```dart
  /// ScreenWidth 640.0
  /// ```
  ///
  static const double mobile = 640.0;

  /// - .isMobile
  ///- .isTablet
  ///- .isTabletOrMobile
  ///- .isDesktop
  ///- .isFullHd
  Breakpoints(this.context) {
    _screenWidth = MediaQuery.sizeOf(context).width;
  }

  /// ```dart
  /// ScreenWidth >= 1920.0
  /// ```
  bool get isFullHd {
    return _screenWidth >= fullHd;
  }

  /// ```dart
  /// ScreenWidth >= 1280.0
  /// ```
  bool get isDesktop {
    return _screenWidth >= tablet;
  }

  /// ```dart
  ///  ScreenWidth < 1280.0
  /// ```
  bool get isTabletOrMobile {
    return _screenWidth < tablet;
  }

  /// ```dart
  /// ScreenWidth < 1280.0 && ScreenWidth >= 640.0
  /// ```
  bool get isTablet {
    return _screenWidth < tablet && _screenWidth >= mobile;
  }

  /// ```dart
  /// ScreenWidth < 640.0
  /// ```
  bool get isMobile {
    return _screenWidth < mobile;
  }
}
