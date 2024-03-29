import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';


class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          DotStepper(
            direction: Axis.vertical,
            activeStep: 0,
            dotCount: 3,
            dotRadius: 6,
            spacing: 56,
            lineConnectorsEnabled: true,
            indicator: Indicator.jump,
            fixedDotDecoration: const FixedDotDecoration(color: Colors.grey),
            indicatorDecoration:
                const IndicatorDecoration(color: Colors.teal),
          ),
          const SizedBox(
            width: 20,
          ),
          const SizedBox(
            height: 150,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Order is Confirmed"),
                  Text("Out for delivery"),
                  Text("Order delivered")
                ]),
          ),
        ],
      ),
    );
  }
}
