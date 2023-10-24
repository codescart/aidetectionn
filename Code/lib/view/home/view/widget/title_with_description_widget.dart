import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';
import 'package:lungs_pneumonia_ai/core/constants/image_constants.dart';
import '../../../../core/init/theme/color/color_theme.dart';

class TitleWithDescription extends StatelessWidget {
  final String title;
  final String? description;
  final bool? isBackButtonActive;
  const TitleWithDescription({
    super.key,
    required this.title,
    this.description,
    this.isBackButtonActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Utility(context).dynamicWidthPixel(80),
          ),
          child: Row(
            children: [
              isBackButtonActive != null
                  ? isBackButtonActive == true
                      ? Padding(
                          padding: EdgeInsets.only(
                            right: Utility(context).dynamicWidthPixel(16),
                          ),
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: SvgPicture.asset(ImageConstants.instance.svgPath.back),
                          ),
                        )
                      : const SizedBox()
                  : const SizedBox(),
              Text(
                title.tr,
                style: Utility(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        description != null
            ? Padding(
                padding: EdgeInsets.only(
                  top: Utility(context).dynamicWidthPixel(16),
                ),
                child: Text(
                  description!.tr,
                  style: Utility(context).textTheme.bodySmall!.copyWith(color: AppColors().grey1),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
