import 'package:flutter/material.dart';
import 'package:islamyapp/core/utils/constant_colors.dart';
import 'package:islamyapp/core/utils/styles.dart';

class CustomContainerTime extends StatelessWidget {
  const CustomContainerTime({
    super.key,
    required this.name,
    required this.time,
    required this.period,
  });

  final String name;
  final String time;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 104,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [kBlack, kgradint],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name, style: Styles.textStylew16),
          Text(time, style: Styles.textStylew24),
          Text(period, style: Styles.textStylew16),
        ],
      ),
    );
  }
}
