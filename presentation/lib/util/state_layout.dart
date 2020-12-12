import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../config/color.dart';

class StateLayout extends StatelessWidget {
  final bool _isLoading;
  final Widget _child;

  StateLayout({bool isLoading, Widget child})
      : _isLoading = isLoading,
        _child = child;

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return _child;
    }
    return Stack(children: <Widget>[
      _child,
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: SpinKitThreeBounce(
            color: appColor,
            size: 16,
          ),
        ),
      )
    ]);
  }
}
