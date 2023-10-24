import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';
import '../../init/theme/color/color_theme.dart';

class BaseSelectedListViewWidget extends StatelessWidget {
  final String buttonText;
  final Color color;

  const BaseSelectedListViewWidget({
    super.key,
    required this.buttonText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Utility(context).dynamicWidthPixel(18),
      ),
      child: Container(
        width: Utility(context).dynamicWidthPixel(340),
        decoration: BoxDecoration(
          color: AppColors().white,
          border: Border.all(width: 1.5, color: color),
          borderRadius: BorderRadius.circular(
            Utility(context).dynamicHeightPixel(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: Utility(context).dynamicWidthPixel(16),
            right: Utility(context).dynamicWidthPixel(8),
            top: Utility(context).dynamicWidthPixel(18),
            bottom: Utility(context).dynamicWidthPixel(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Utility(context).dynamicWidthPixel(8),
                  right: Utility(context).dynamicWidthPixel(8),
                ),
                child: Text(
                  buttonText.tr,
                  style: Utility(context).textTheme.bodyMedium!.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
