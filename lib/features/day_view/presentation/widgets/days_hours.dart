import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graildo_assessment/features/day_view/presentation/business_logic/controller/day_view_state_controller.dart';
import 'package:graildo_assessment/features/day_view/presentation/widgets/current_time_line.dart';
import 'package:graildo_assessment/style/app_colors.dart';
import 'package:graildo_assessment/style/app_dimensions_controller.dart';
import 'package:graildo_assessment/style/app_text_style.dart';
import 'package:intl/intl.dart';

class DaysHoursWidget extends StatefulWidget {
  const DaysHoursWidget({Key? key}) : super(key: key);

  @override
  State<DaysHoursWidget> createState() => _DaysHoursWidgetState();
}

class _DaysHoursWidgetState extends State<DaysHoursWidget> {
  @override
  void initState() {
    super.initState();
    print(getCurrentTimeInHoursAndMinutes());
    timeSlots(context);
    Timer.periodic(const Duration(minutes: 1),
        (timer) => getCurrentTimeInHoursAndMinutes());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.w(context, 0.05),
          right: Dimensions.w(context, 0.02)),
      child: SizedBox(
        height: Dimensions.h(context, 0.75),
        width: Dimensions.w(context, 0.94),
        child: ListView(
          children: [
            SizedBox(
              width: Dimensions.w(context, 0.1),
              child: SizedBox(
                width: Dimensions.w(context, 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: timeSlots(context)
                      .map<Widget>(
                        (singleTimeSlot) => singleTimeSlot
                                .toString()
                                .contains(':')
                            ? Row(
                                children: [
                                  SizedBox(
                                    height: Dimensions.h(context, 0.00154),
                                  ),
                                  SizedBox(
                                    width: Dimensions.w(context, 0.088),
                                  ),
                                  singleTimeSlot !=
                                          getCurrentTimeInHoursAndMinutes()
                                      ? Container()
                                      : const CurrentTimeWidget(),
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    singleTimeSlot,
                                    style: AppTextStyle.blackSmall,
                                  ),
                                  SizedBox(
                                    width: Dimensions.w(context, 0.05),
                                  ),
                                  singleTimeSlot !=
                                          getCurrentTimeInHoursAndMinutes()
                                      ? Container(
                                          height: Dimensions.h(context, 0.0003),
                                          width: Dimensions.w(context, 0.73),
                                          color: Colors.grey,
                                        )
                                      : const CurrentTimeWidget()
                                ],
                              ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> timeSlots(BuildContext context) {
    List<String> hoursOfTheDay = [];
    hoursOfTheDay.add('12 AM');
    for (int minutes = 1; minutes <= 59; minutes++) {
      if (minutes < 10) {
        hoursOfTheDay.add('12:0$minutes PM');
      } else {
        hoursOfTheDay.add('12:$minutes PM');
      }
    }
    for (int time = 1; time < 24; time++) {
      if (time >= 12) {
        int realtime = time != 12 ? time - 12 : 12;
        hoursOfTheDay.add('$realtime PM');
        for (int minutes = 1; minutes <= 59; minutes++) {
          if (minutes < 10) {
            hoursOfTheDay.add('$time:0$minutes PM');
          } else {
            hoursOfTheDay.add('$time:$minutes PM');
          }
        }
      } else {
        hoursOfTheDay.add('$time AM');
        for (int minutes = 1; minutes <= 59; minutes++) {
          if (minutes < 10) {
            hoursOfTheDay.add('$time:0$minutes AM');
          } else {
            hoursOfTheDay.add('$time:$minutes AM');
          }
        }
      }
    }
    return hoursOfTheDay;
  }

  String getCurrentTimeInHoursAndMinutes() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm a').format(now);
    setState(() {});
    return formattedTime;
  }
}
