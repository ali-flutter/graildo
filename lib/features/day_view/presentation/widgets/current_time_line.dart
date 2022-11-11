import 'package:flutter/material.dart';
import '../../../../style/app_colors.dart';
import '../../../../style/app_dimensions_controller.dart';

class CurrentTimeWidget extends StatelessWidget {
  const CurrentTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Dimensions.h(context, 0.015),
          width: Dimensions.w(context, 0.034),
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000)),
            color: AppColors.primaryColor,
          ),
        ),
        Container(
          height: Dimensions.h(context, 0.003),
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: Dimensions.h(context, 0.0018),
              width: Dimensions.w(context, 0.73),
              color: AppColors.primaryColor,
            ),
          ),
        ),

      ],
    );
  }
}
