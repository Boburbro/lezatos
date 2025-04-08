import 'package:flutter/material.dart';

class AppLogger {
  static void warming(String message) {
    debugPrint("\x1B[33m $message \x1B[0m");
  }

  static void error(String message) {
    debugPrint("\x1B[31m $message \x1B[0m");
  }
}