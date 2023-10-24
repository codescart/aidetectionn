import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lungs_pneumonia_ai/core/base/components/bottom_navigation_bar_widget.dart';
import 'package:lungs_pneumonia_ai/core/base/components/button/base_button.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';
import 'package:lungs_pneumonia_ai/core/init/theme/color/color_theme.dart';
import 'package:lungs_pneumonia_ai/view/home/view/widget/title_with_description_widget.dart';
import 'package:lungs_pneumonia_ai/view/process/controller/process_controller.dart';

class ProcessResultView extends GetView<ProcessController> {
  const ProcessResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: GetBuilder<ProcessController>(
          builder: (processController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithDescription(
                  title: "scanResult",
                  description: "scanResultDescription",
                  isBackButtonActive: true,
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: Utility(context).dynamicWidthPixel(90),
                  ),
                  child: Container(
                    width: Utility(context).dynamicWidth(1),
                    height: Utility(context).dynamicWidthPixel(230),
                    decoration: BoxDecoration(
                      color: AppColors().backgroundColor,
                      borderRadius: BorderRadius.circular(
                        Utility(context).dynamicHeightPixel(15),
                      ),
                      image: DecorationImage(
                        image: FileImage(io.File(processController.xFileImage!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // if index == 1 Pneumonia
                // if index == 0 Healthy
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Utility(context).dynamicWidthPixel(60),
                    ),
                    child: Text(
                      processController.output[0]['index'] == 1 ? "pneumonia".tr : "healthy".tr,
                      style: Utility(context).textTheme.titleLarge!.copyWith(
                            color: processController.output[0]['index'] == 1 ? AppColors().red : AppColors().green,
                          ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Utility(context).dynamicWidthPixel(16),
                    ),
                    child: Text(
                      "confidence".tr + processController.output[0]['confidence'].toString(),
                      style: Utility(context).textTheme.titleLarge!.copyWith(
                            color: AppColors().grey1,
                            fontSize: Utility(context).dynamicTextSize(20),
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Utility(context).dynamicWidthPixel(90),
                    bottom: Utility(context).dynamicWidthPixel(30),
                  ),
                  child: BaseButton(
                    buttonText: 'complete'.tr,
                    onPressed: () {
                      Get.off(const BottomNavigationBarView(selectedIndex: 0));
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
