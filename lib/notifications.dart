import 'package:flutter/material.dart';

class SizeChanged extends Notification {
  final String size;
  SizeChanged(
    this.size,
  );
}

class StackChanged extends Notification {
  final Widget window;
  StackChanged(
    this.window,
  );
}
