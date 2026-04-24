import 'package:flutter/material.dart';
import 'device_type.dart';

class Breakpoints {
  static const double mobileMax = 600;
  static const double tabletMax = 900;

  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileMax) {
      return DeviceType.mobile;
    }
    if (width < tabletMax) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}
