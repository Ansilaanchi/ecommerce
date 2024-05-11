import 'package:fashion_world/trackOrder/eventCard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget? eventCart;

  const MyTimeLine({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    this.eventCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.sp,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        // Decorate the line
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.red : Color.fromARGB(255, 224, 219, 219),
        ),
        // Decorate the icon
        indicatorStyle: IndicatorStyle(
          width: 22.sp,
          color: isPast ? Colors.red : Color.fromARGB(255, 224, 219, 219),
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: Colors.white,
          ),
        ),
        endChild: EventCart(
          isPast: isPast,
          child: eventCart,
        ),
      ),
    );
  }
}
