// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';
import 'package:lungs_pneumonia_ai/core/init/theme/color/color_theme.dart';

class ImageSourceWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function onTap;
  const ImageSourceWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Utility(context).dynamicWidthPixel(36),
      ),
      child: Container(
        width: Utility(context).dynamicWidth(1),
        height: Utility(context).dynamicWidthPixel(130),
        decoration: BoxDecoration(
          color: AppColors().white,
          borderRadius: BorderRadius.circular(
            Utility(context).dynamicHeightPixel(15),
          ),
        ),
        child: InkWell(
          onTap: () => onTap(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                iconPath,
                color: AppColors().grey1,
                height: Utility(context).dynamicWidthPixel(56),
              ),
              Text(
                title.tr,
                style: Utility(context).textTheme.titleMedium!.copyWith(
                      color: AppColors().mainBlueColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
