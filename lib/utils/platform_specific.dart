import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformSpecific {
  static bool isWearOS() {
    if (kIsWeb) return false;
    return Platform.isAndroid && !Platform.isIOS;
  }

  static bool isWatchOS() {
    if (kIsWeb) return false;
    return Platform.isIOS && !Platform.isAndroid;
  }
}
