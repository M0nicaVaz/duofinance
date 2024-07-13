import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouteExtension on BuildContext {
  goPush<T>(String route, {Map<String, String>? extra}) async => kIsWeb
      ? GoRouter.of(this).go(route, extra: extra)
      : await GoRouter.of(this).push(route, extra: extra);
}
