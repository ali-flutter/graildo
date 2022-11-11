import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graildo_assessment/style/app_colors.dart';
import 'package:graildo_assessment/style/app_dimensions_controller.dart';
import 'package:graildo_assessment/style/app_text_style.dart';
import 'package:in_date_utils/in_date_utils.dart' as dt;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../business_logic/controller/day_view_state_controller.dart';
import 'package:intl/intl.dart';

class CalenderWidget extends ConsumerStatefulWidget {
  const CalenderWidget({super.key});

  @override
  CalenderWidgetState createState() => CalenderWidgetState();
}

class CalenderWidgetState extends ConsumerState<CalenderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print(getMonthsDays(ref.watch(monthNumber)));
    print(getDaysName(
        month: 'November',
        monthDaysNumber:
            dt.DTU.getDaysInMonth(DateTime.now().year, DateTime.now().month),
        year: DateTime.now().year));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.h(context, 0.05),
          width: Dimensions.w(context, 1),
          child: Row(
            children: [
              SizedBox(
                width: Dimensions.w(context, 0.01),
              ),
              Consumer(builder: (context, WidgetRef ref, _) {
                return IconButton(
                  onPressed: () {
                    if (ref.watch(monthNumber) != 1)
                      ref.watch(monthNumber.notifier).state--;
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.primaryColor,
                    size: 28,
                  ),
                );
              }),
              SizedBox(
                width: Dimensions.w(context, 0.4),
                child: Consumer(builder: (context, WidgetRef ref, _) {
                  return Text(
                    (ref.watch(months)[ref.watch(monthNumber) - 1])
                        .toUpperCase(),
                    style: AppTextStyle.mediumBlue,
                  );
                }),
              ),
              SizedBox(
                width: Dimensions.w(context, 0.35),
              ),
              Consumer(builder: (context, WidgetRef ref, _) {
                return IconButton(
                  onPressed: () {
                    if (ref.watch(monthNumber) != 12) {
                      ref.watch(monthNumber.notifier).state++;
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryColor,
                    size: 28,
                  ),
                );
              }),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.h(context, 0.03),
        ),
        Consumer(builder: (context, WidgetRef ref, _) {
          return SizedBox(
            width: double.infinity,
            height: Dimensions.h(context, 0.12),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: ref.watch(daysOfMonth).length,
                itemBuilder: (context, int i) {
                  return Column(
                    children: [
                      SizedBox(
                        child: Text(
                          (getDaysName(
                                  month: ref.watch(
                                      months)[ref.watch(monthNumber) - 1],
                                  monthDaysNumber: dt.DTU.getDaysInMonth(
                                      DateTime.now().year,
                                      DateTime.now().month),
                                  year: DateTime.now().year)[i])
                              .substring(0, 3)
                              .toUpperCase(),
                          style: AppTextStyle.greySmall,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h(context, 0.02),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(i);
                          print(ref.watch(selectedDayIndex));
                          ref.watch(selectedDayIndex.notifier).state = i;
                        },
                        child: Container(
                          height: Dimensions.h(context, 0.05),
                          width: Dimensions.w(context, 0.15),
                          decoration: BoxDecoration(
                            color: ref.watch(selectedDayIndex) == i &&
                                    ref.watch(monthNumber) ==
                                        DateTime.now().month
                                ? AppColors.primaryColor
                                : AppColors.scaffoldBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${ref.watch(daysOfMonth)[i]}',
                              style: /*DateTime.now().day==ref.watch(daysOfMonth)[i]*/
                                  ref.watch(selectedDayIndex) == i &&
                                          ref.watch(monthNumber) ==
                                              DateTime.now().month
                                      ? const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.5,
                                        )
                                      : const TextStyle(
                                          color: Colors.black, fontSize: 17.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          );
        }),
      ],
    );
  }

  List getMonthsDays(int month) {
    int monthDays = dt.DTU.getDaysInMonth(DateTime.now().year, month);
    for (int i = 1; i <= monthDays; i++) {
      ref.watch(daysOfMonth.notifier).state.add(i);
    }
    print(ref.watch(daysOfMonth));
    return ref.watch(daysOfMonth);
  }

  List<String> getDaysName(
      {required String month,
      required int monthDaysNumber,
      required int year}) {
    List<String> daysNames = [];
    for (int i = 1; i <= monthDaysNumber; i++) {
      String dayName = DateFormat('EEEE')
          .format(DateFormat("DD MMMM yyyy").parse('$i $month $year'));
      daysNames.add(dayName);
    }
    return daysNames;
  }
}
