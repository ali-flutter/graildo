import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graildo_assessment/features/add_task/presentation/widgets/add_task_actions.dart';
import 'package:graildo_assessment/features/day_view/presentation/widgets/calender_widget/calender_widget.dart';
import 'package:graildo_assessment/features/day_view/presentation/widgets/days_hours.dart';
import 'package:graildo_assessment/style/app_colors.dart';
import 'package:graildo_assessment/style/app_dimensions_controller.dart';
import 'package:graildo_assessment/style/app_text_style.dart';

import '../../../add_task/presentation/widgets/add_task_content.dart';
import '../business_logic/controller/day_view_state_controller.dart';

class DayViewPage extends StatelessWidget {
  const DayViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.h(context, 0.05)),
            const CalenderWidget(),
            const DaysHoursWidget(),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          SizedBox(
            height: Dimensions.h(context, 0.9),
          ),
          Consumer(builder: (context, ref, _) {
            return FloatingActionButton(
              elevation: 1,
              backgroundColor: AppColors.appSecondaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 37,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: AppColors.scaffoldBackgroundColor,
                    title: Text(
                      'Add Task',
                      style: AppTextStyle.blackMedium,
                    ),
                    content: Builder(
                      builder: (context) {
                        var height = MediaQuery.of(context).size.height;
                        var width = MediaQuery.of(context).size.width;
                        return AddTaskContent(
                          height: height * 0.28,
                          width: width * 1,
                          textFromFieldText: ref.watch(textFormFieldText),
                          onChanged: (value) => ref
                              .watch(textFormFieldText.notifier)
                              .state = value,
                        );
                      },
                    ),
                    actions: [
                      Consumer(builder: (context, ref, _) {
                        return AddTaskActions(
                          onCancelPressed: () {
                            Navigator.pop(context);
                          },
                          onOkPressed: () {

                            if (ref.watch(textFormFieldText) != null) {
                              ref.watch(task.notifier).state={
                                ref.watch(initalDate):ref.watch(textFormFieldText)
                              };
                            ref.watch(allTasks.notifier).state.add(task);
                            print(ref.watch(allTasks ));
                              Navigator.pop(context);
                            } else {
                              ref.watch(errorMessage.notifier).state='You should add a Title';
                            }
                          },
                        );
                      })
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
