import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:islamyapp/core/utils/styles.dart';

class CustomTimeView extends StatelessWidget {
  const CustomTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                DateFormat("d MMM").format(DateTime.now()),
                style: Styles.textStylew14,
              ),
              Text("${DateTime.now().year}", style: Styles.textStylew14),
            ],
          ),
          Column(
            children: [
              Text("Pray time ", style: Styles.textStyle20b),
              Text(
                DateFormat.EEEE("en").format(DateTime.now()),
                style: Styles.textStyle20b,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                HijriCalendar.now().toFormat("dd MMMM"),
                style: Styles.textStylew14,
              ),
              Text("1447 ", style: Styles.textStylew14),
            ],
          ),
        ],
      ),
    );
  }
}
