import 'package:flutter/material.dart';
import 'breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoints.tabletMax) {
          return desktop != null
              ? desktop!(context)
              : (tablet != null ? tablet!(context) : mobile(context));
        }
        if (constraints.maxWidth >= Breakpoints.mobileMax &&
            constraints.maxWidth < Breakpoints.tabletMax) {
          return tablet != null ? tablet!(context) : mobile(context);
        }
        return mobile(context);
      },
    );
  }
}
