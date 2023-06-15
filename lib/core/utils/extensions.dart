import 'package:flutter/cupertino.dart';

extension NavigatorExt on BuildContext {
  Future pushNamed(String route, {Object? arguments}) =>
      Navigator.of(this).pushNamed(route, arguments: arguments);

  Future pushReplacementNamed(
    String route, {
    Object? result,
    Object? arguments,
  }) =>
      Navigator.of(this)
          .pushReplacementNamed(route, result: result, arguments: arguments);

  void pop([Object? arguments]) => Navigator.of(this).pop(arguments);
}
