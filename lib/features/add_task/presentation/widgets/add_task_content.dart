import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graildo_assessment/features/day_view/presentation/business_logic/controller/day_view_state_controller.dart';
import 'package:graildo_assessment/style/app_colors.dart';
import 'package:intl/intl.dart';
import '../../../../style/app_dimensions_controller.dart';
import '../../../../style/app_text_style.dart';

class AddTaskContent extends ConsumerWidget {
  const AddTaskContent(
      {Key? key,
        required this.onChanged,
      required this.textFromFieldText,
      required this.width,
      required this.height})
      : super(key: key);
  final double height;
  final double width;
  final String? textFromFieldText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          TextFormField(
            cursorColor: AppColors.lightBlackColor,

            decoration: InputDecoration(
              fillColor: const Color(0xffF7F7F7),
              filled: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Add title',
              hintStyle: AppTextStyle.appHintStyle,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
            ),onChanged: onChanged,
          ),
          SizedBox(
            height: Dimensions.h(context, 0.03),
          ),
          Container(
            height: Dimensions.h(context, 0.063),
            width: Dimensions.w(context, 1),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color(0xffF7F7F7),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.w(context, 0.03),
                ),
                Consumer(builder: (context, ref, _) {
                  return Text(
                    ref.watch(initalDate),
                    style: AppTextStyle.appHintStyle,
                  );
                }),
                SizedBox(
                  width: Dimensions.w(context, 0.24),
                ),
                IconButton(
                  onPressed: () async {
                    DatePicker.showDatePicker( context,
                      currentTime: DateTime.now(),
                      onConfirm: (pickedDate){
                      ref.watch(initalDate.notifier).state=DateFormat('yyyy/MM/dd - HH:mm').format(pickedDate);
                      }
                    );
                  },
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xff9C9C9C),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height:Dimensions.h(context, 0.05) ,
          ),
          Text(ref.watch(errorMessage),style: TextStyle(
            color: Colors.red,

          ),)
        ],
      ),
    );
  }
}
