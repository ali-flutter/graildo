import 'package:flutter/material.dart';
import 'package:graildo_assessment/style/app_colors.dart';
import 'package:graildo_assessment/style/app_dimensions_controller.dart';

class AddTaskActions extends StatelessWidget {
  const AddTaskActions(
      {Key? key, required this.onOkPressed, required this.onCancelPressed})
      : super(key: key);
  final void Function()? onOkPressed;
  final void Function()? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width:Dimensions.w(context, 0.09) ,
        ),
        ElevatedButton(
          onPressed: onCancelPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15),),
              )
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all(AppColors.scaffoldBackgroundColor),
          ),
          child: SizedBox(
            height: Dimensions.h(context, 0.043),
            width: Dimensions.w(context, 0.2),
            child: const Center(
              child: Text('Cancel',style: TextStyle(
                color: AppColors.primaryColor,
              ),),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onOkPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          ),
          child: SizedBox(
            height: Dimensions.h(context, 0.043),
            width: Dimensions.w(context, 0.24),
            child: const Center(
              child: Text('Save'),
            ),
          ),
        ),
      ],
    );
  }
}
