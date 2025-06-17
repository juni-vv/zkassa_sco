import 'dart:ui';

import 'package:flutter/material.dart';

class DragScrollBehavior extends MaterialScrollBehavior {
  // allow for mouse to drag
  @override
  Set<PointerDeviceKind> get dragDevices => {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}
