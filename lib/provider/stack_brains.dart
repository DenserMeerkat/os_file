import 'package:flutter/material.dart';

class StackBrains {
  static int _lenth = 0;
  static final List<Widget> _stackList = [];

  static String appendWindow(Widget widget) {
    _stackList.add(widget);
    _lenth += 1;
    return "success";
  }

  static String removeWindow(Widget widget) {
    _stackList.remove(widget);
    _lenth -= 1;
    return "success";
  }

  static int currLength() {
    return _lenth;
  }

  static List<Widget> retrieveList() {
    return _stackList;
  }

  static String clearStack() {
    try {
      _stackList.clear();
      _lenth = 0;
      return "success";
    } on Exception catch (e) {
      return "Error: ran into exception - $e";
    }
  }
}
