import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Skeleton extends StatelessWidget {
  final Widget child;
  final bool enabled;
  const Skeleton({
    super.key,
    required this.child,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: child,
    );
  }
}
