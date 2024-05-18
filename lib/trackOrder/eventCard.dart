import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventCart extends StatelessWidget {
  final bool isPast;
  final Widget? child;

  const EventCart({
    Key? key,
    required this.isPast,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.sp),
      child: child,
    );
  }
}
